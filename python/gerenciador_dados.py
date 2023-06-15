def getCabecalho(caminho):
    with open(caminho, 'r') as f:
        line = f.readline()
        line = line.rstrip('\n')
        atributos = line.split(',')
        for i in range(len(atributos)):
            atributos[i] = atributos[i].strip('"')
        return atributos

def separarDados(caminho, target, cabecalho):
    X = []
    y = []

    indice_target = cabecalho.index(target)

    with open(caminho, 'r') as f:
        f.readline()
        for line in f:
            line = line.rstrip('\n')
            atributos = line.split(',')
            valores = []
            if ('' not in atributos):
                for i in range(len(atributos)):
                    atributos[i] = atributos[i].strip('"')
                    if indice_target == i:
                        try:
                            atributos[i]=int(atributos[i])
                        except:
                            atributos[i]=atributos[i]
                        y.append(atributos[i])
                    else:
                        try:
                            atributos[i]=float(atributos[i])
                        except:
                            atributos[i]=atributos[i]
                        valores.append(atributos[i])
                X.append(valores)
    
    return X, y

def getCategoricos(dados, cabecalho):
    primeira_linha = dados[0]
    indices_categoricos = []
    campos_categoricos = []
    cabecalho_categoricos = []

    for elemento in primeira_linha:
        if(isinstance(elemento,str)):
            indice = primeira_linha.index(elemento)
            indices_categoricos.append(indice)
            cabecalho_categoricos.append(cabecalho[indice])

    if len(indices_categoricos) != 0:
        for linha in dados:
            campo = []
            for indice in indices_categoricos:
                campo.append(linha[indice])
            campos_categoricos.append(campo)

            for elemento in campo:
                linha.remove(elemento)

    return indices_categoricos, campos_categoricos,cabecalho_categoricos

def reincluirCategoricosTransformados(dados, categoricos):
    for linha in dados:
        indice = dados.index(linha)
        dados[indice] = dados[indice] + categoricos[indice]

    return dados

def incluirCabecalhoCategoricos(encoder,cabecalho, cabecalho_categorico):
    for atributo in cabecalho_categorico:
        cabecalho.remove(atributo)
    
    return cabecalho + encoder.get_feature_names_out(cabecalho_categorico).tolist()