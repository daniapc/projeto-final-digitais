def exportar_vhdl(resultado, cabecalho):

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
    