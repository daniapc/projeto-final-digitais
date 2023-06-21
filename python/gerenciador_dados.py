from sklearn.preprocessing import OneHotEncoder

def get_cabecalho(caminho):
    with open(caminho, 'r') as f:
        line = f.readline()
        line = line.rstrip('\n')
        atributos = line.split(',')
        for i in range(len(atributos)):
            atributos[i] = atributos[i].strip('"')
        return atributos

def separar_dados(caminho, target, cabecalho):
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
    
    cabecalho.remove(target)
    return X, y

def get_categoricos(dados, cabecalho):
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

    return campos_categoricos,cabecalho_categoricos

def reincluir_categoricos_transformados(dados, categoricos):
    for linha in dados:
        indice = dados.index(linha)
        dados[indice] = dados[indice] + categoricos[indice]

    return dados

def incluir_cabecalho_categoricos(encoder,cabecalho, cabecalho_categorico):
    for atributo in cabecalho_categorico:
        cabecalho.remove(atributo)
    
    return cabecalho + encoder.get_feature_names_out(cabecalho_categorico).tolist()

def gerenciar_categoricos(X, cabecalho):
    for atributo in cabecalho:
        atributo.replace('_', ' ')

    campos_categoricos,cabecalho_categoricos = get_categoricos(X, cabecalho)

    if len(campos_categoricos) != 0:
        encoder = OneHotEncoder(handle_unknown='ignore')
        encoder = encoder.fit(campos_categoricos)
        array_categorico = encoder.transform(campos_categoricos).toarray()
        X = reincluir_categoricos_transformados(X, array_categorico.tolist())
        cabecalho = incluir_cabecalho_categoricos(encoder,cabecalho,cabecalho_categoricos)

    return X, cabecalho

def filtrar_atributos(dados, cabecalho, profundidade):   
    tam = len(cabecalho) 
    amostra = dados[0:20]
    media = [0]*tam

    for linha in amostra:
        for i in range(tam):
            if not(isinstance(linha[i],str)):
                media[i] += linha[i]/20
    
    indices = {}
    for valor in media:
        indices[valor] = media.index(valor)

    media.sort(reverse=True)
    del media[:profundidade]

    trash_indexes = []
    for element in media:
        trash_indexes.append(indices[element])

    trash = []
    for index in trash_indexes:
        trash.append(cabecalho[index])
    for elemento in trash:
        cabecalho.remove(elemento)

    for linha in dados:
        trash = []
        for index in trash_indexes:
            trash.append(linha[index])
        for elemento in trash:
            linha.remove(elemento)

    return dados, cabecalho

