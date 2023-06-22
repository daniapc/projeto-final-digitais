import os
import platform

def exportar_vhdl(resultado, cabecalho, valores_pred):

    result_array = resultado.replace(' ','').replace('---','').split('\n')

    for line in result_array:
        if ('<=' in line):
            identation = line.rfind('|') + 1

            dividido = line.replace('|','').split('<=')
            else_statement = line[0:identation] + dividido[0] + '>' + dividido[1]
            index_else = result_array.index(else_statement)
            result_array[index_else] = line[0:identation] + 'else'

    result_array_endif = result_array.copy()

    for line in result_array:
        if('<=' in line):
            identation = line.rfind('|') + 1
            identation_counter = line.count('|')

            current_index = result_array_endif.index(line)
            for i in range(current_index, len(result_array_endif)):
                i_counter = result_array_endif[i].count('|')
                if (i_counter < identation_counter):
                    result_array_endif.insert(i, line[0:identation] + 'end if;')
                    break
            result_array_endif[current_index] = line[0:identation] + 'if ' + line[identation:] + ' then'

    for atributo in cabecalho:
        cabecalho[cabecalho.index(atributo)] = atributo.replace(' ', '')

    categoricos = cabecalho.copy()
    trash = []
    for atributo in cabecalho:
        if '_' not in atributo:
            categoricos.remove(atributo)
        else: 
            trash.append(atributo)
            i = categoricos.index(atributo)
            categoricos[i] = categoricos[i].split('_')[0]
    categoricos = list(dict.fromkeys(categoricos))

    categoricos_copy = categoricos.copy()

    valores_categoricos = [[]]
    for atributo in cabecalho:
        if '_' in atributo:
            campo = atributo.split('_')[0]
            valor = atributo.split('_')[1].replace(' ', '')
            if (campo in categoricos):
                i = categoricos.index(campo)
                if (i >= len(valores_categoricos)):
                    valores_categoricos.append([])
                valores_categoricos[i].append(valor)
    
    for atributo in trash:
        cabecalho.remove(atributo)

    cabecalho = cabecalho + categoricos

    valores_y = []

    if (isinstance(valores_pred[0], str)):
        valores_y = list(dict.fromkeys(valores_pred))
        for valores in valores_y:
            if isinstance(valores,str):
                valores_y[valores_y.index(valores)] = valores.replace(' ', '')

    for line in result_array_endif:
        if('<=' in line):
            condicao = line.replace('if ', '').replace('|', '').replace(' then', '')
            info = condicao[0:condicao.find('<')]
            if ('_' in condicao):
                campo = info.split('_')[0]
                valor = info.split('_')[1]
                index_campo = categoricos.index(campo)
                index_valor = (valores_categoricos[index_campo]).index(valor)
                result_array_endif[result_array_endif.index(line)] = line.replace(condicao, 
                    '(not(atributo_' + str(cabecalho.index(campo)) + ' = ' + str(index_valor)+ '))')
            else:
                valor = condicao[condicao.find('=') + 1:]
                result_array_endif[result_array_endif.index(line)] = line.replace(condicao, 
                    '(atributo_' + str(cabecalho.index(info)) + ' <= ' + str(int(float(valor))) + ')')
        elif ('class:' in line):
            predicao = line.replace('|','')
            valor = predicao.split(':')[1].replace(' ', '')
            if (valor.replace(".", "").isnumeric()):
                valor = float(valor)
            result_array_endif[result_array_endif.index(line)] = line.replace(predicao,
                'outcome <= ' + (str(valores_y.index(valor)) if isinstance(valor, str) else str(valor)) + ';')
        
    for line in result_array_endif:
        result_array_endif[result_array_endif.index(line)] = '           ' + line.replace('|', '   ')

    caminho = os.path.abspath(os.getcwd())
    slash = '\\' if platform.system() == 'Windows' else '/'

    caminho_comeco = caminho + slash + 'vhdl' + slash + 'vhdl_comeco.vhdl'
    caminho_fim = caminho + slash +'vhdl' + slash + 'vhdl_fim.vhdl'
    caminho_out = caminho + slash +'out' + slash + 'infos.txt'
    caminho = caminho[:caminho.rfind(slash)] + slash + 'quartus' + slash + 'atributos.vhdl'

    f = open(caminho_comeco, "r")
    comeco = f.read()
    f.close()

    f = open(caminho_fim, "r")
    fim = f.read()
    f.close()

    codigo = comeco + '\n'.join(result_array_endif) + fim

    f = open(caminho, "w")
    f.write(codigo)
    f.close()

    f = open(caminho_out, "w")

    buffer = '\n[Atributos em ordem e seus respectivos campos]'
    f.write(buffer + '\n')
    print(buffer)
    for atributo in cabecalho:
        buffer = 'FIELd_' + str(cabecalho.index(atributo)) + ': ' + atributo
        print(buffer)
        f.write(buffer + '\n')
    
    if (len(categoricos_copy) > 0):
        buffer = '\n[Categóricos em ordem e seus respectivos campos]'
        print(buffer)
        f.write(buffer + '\n')
        for categorico in categoricos_copy:
            buffer = 'FIELd_' + str(cabecalho.index(categorico)) + ': ' + categorico
            print(buffer)
            f.write(buffer + '\n')
            i = categoricos_copy.index(categorico)
            for valor in valores_categoricos[i]:
                buffer = '>> '+ str(valores_categoricos[i].index(valor)) + ': ' + valor
                print(buffer)
                f.write(buffer + '\n')
        
    if (len(valores_y) > 0):
        if (len(categoricos_copy) == 0):
            buffer = '\n[Categóricos em ordem e seus respectivos campos]'
            print(buffer)
            f.write(buffer + '\n')

        buffer = 'PrEdiCao:'
        print(buffer)
        f.write(buffer + '\n')
        for valor in valores_y:
            buffer = '>> '+ str(valores_y.index(valor)) + ': ' + valor
            print(buffer)
            f.write(buffer + '\n')
    
    f.close()