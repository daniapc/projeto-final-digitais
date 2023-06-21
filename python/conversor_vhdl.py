import os

def exportar_vhdl(resultado, cabecalho, valores_pred):

    result_array = resultado.replace(' ','').replace('-','').split('\n')

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

    print(*result_array_endif, sep='\n')

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

    print(categoricos)

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
    print(cabecalho)

    print(valores_categoricos)

    if (isinstance(valores_pred[0], str)):
        valores_y = list(dict.fromkeys(valores_pred))
        for valores in valores_y:
            if isinstance(valores,str):
                valores_y[valores_y.index(valores)] = valores.replace(' ', '')
        print(valores_y)

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
                    'atributo_' + str(cabecalho.index(campo)) + ' \= ' + str(index_valor))
            else:
                valor = condicao[condicao.find('=') + 1:]
                result_array_endif[result_array_endif.index(line)] = line.replace(condicao, 
                    'atributo_' + str(cabecalho.index(info)) + ' <= ' + valor)
        elif ('class:' in line):
            predicao = line.replace('|','')
            valor = predicao.split(':')[1].replace(' ', '')
            if (valor.replace(".", "").isnumeric()):
                valor = float(valor)
            result_array_endif[result_array_endif.index(line)] = line.replace(predicao,
                'outcome <= ' + (str(valores_y.index(valor)) if isinstance(valor, str) else str(valor)) + ';')
        
    for line in result_array_endif:
        result_array_endif[result_array_endif.index(line)] = '           ' + line.replace('|', '   ')

    print(*result_array_endif, sep='\n')

    caminho = os.path.abspath(os.getcwd())

    caminho_comeco = caminho + '\\vhdl\\vhdl_comeco.vhdl'
    caminho_fim = caminho + '\\vhdl\\vhdl_fim.vhdl'
    caminho = caminho[:caminho.rfind('\\')] + '\\quartus\\atributos.vhdl'

    f = open(caminho_comeco, "r")
    comeco = f.read()
    f.close()

    f = open(caminho_fim, "r")
    fim = f.read()
    f.close()

    codigo = comeco + '\n'.join(result_array_endif) + fim

    print(codigo)

    f = open(caminho, "w")
    f.write(codigo)
    f.close()