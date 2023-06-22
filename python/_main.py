import os
import gerenciador_dados
import conversor_vhdl
import platform

from sklearn import tree
from sklearn.tree import export_text

dataset = input("Digite o nome do arquivo de dados (incluindo .csv): ")
target = input("Digite o nome do target para predições: ").replace(' ', '-')

if dataset == '' or target == '':
    dataset = "diabetes.csv"
    target = "Diabetes"

slash = '\\' if platform.system() == 'Windows' else '/'
caminho = os.path.abspath(os.getcwd()) + slash + "datasets" + slash + dataset

try: 
    cabecalho = gerenciador_dados.get_cabecalho(caminho)
    profundidade = 5

    X, y = gerenciador_dados.separar_dados(caminho, target, cabecalho)

    if len(cabecalho) > profundidade:
        X, cabecalho = gerenciador_dados.filtrar_atributos(X, cabecalho, profundidade)

    X, cabecalho = gerenciador_dados.gerenciar_categoricos(X, cabecalho)
except:
    print("\nErro ao carregar ou gerenciar os dados de entrada.\n")

try:
    decision_tree = tree.DecisionTreeClassifier(max_depth=profundidade)
    decision_tree = decision_tree.fit(X, y)

    resultado = export_text(decision_tree, feature_names=cabecalho)

    conversor_vhdl.exportar_vhdl(resultado, cabecalho, y)

    print("\nArquivo VHDL sobrescrito com sucesso, agora basta criar o símbolo no quartus e compilar o programa.\n")
except:
    print("\nErro ao executar o algoritmo ou sobrescrever no arquivo.\n")

