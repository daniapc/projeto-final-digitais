import os
import gerenciador_dados
import conversor_vhdl

from sklearn import tree
from sklearn.tree import export_text

dataset = input("Digite o nome do arquivo de dados (incluindo .csv): ")
target = input("Digite o nome do target para predições: ")

if dataset == '' and target == '':
    dataset = "diabetes.csv"
    target = "Diabetes"
caminho = os.path.abspath(os.getcwd()) + "\\datasets\\" + dataset
cabecalho = gerenciador_dados.get_cabecalho(caminho)
profundidade = 5

X, y = gerenciador_dados.separar_dados(caminho, target, cabecalho)

if len(cabecalho) > profundidade:
    X, cabecalho = gerenciador_dados.filtrar_atributos(X, cabecalho, profundidade)

X, cabecalho = gerenciador_dados.gerenciar_categoricos(X, cabecalho)

try:
    decision_tree = tree.DecisionTreeClassifier(max_depth=profundidade)
    decision_tree = decision_tree.fit(X, y)

    resultado = export_text(decision_tree, feature_names=cabecalho)

    conversor_vhdl.exportar_vhdl(resultado, cabecalho, y)

    print("\nArquivo VHDL sobrescrito com sucesso, agora basta criar o símbolo no quartus e compilar o programa.\n")
except:
    print("\nErro ao executar o algoritmo ou sobrescrever no arquivo.\n")

