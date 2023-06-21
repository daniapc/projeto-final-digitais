import os
import gerenciador_dados
import conversor_vhdl

from sklearn import tree
from sklearn.tree import export_text
 
dataset = "titanic.csv"
caminho = os.path.abspath(os.getcwd()) + "\\datasets\\" + dataset
target = "Joined"
cabecalho = gerenciador_dados.get_cabecalho(caminho)
profundidade = 5

X, y = gerenciador_dados.separar_dados(caminho, target, cabecalho)

if len(cabecalho) > profundidade:
    X, cabecalho = gerenciador_dados.filtrar_atributos(X, cabecalho, profundidade)

X, cabecalho = gerenciador_dados.gerenciar_categoricos(X, cabecalho)

decision_tree = tree.DecisionTreeClassifier(max_depth=profundidade)
decision_tree = decision_tree.fit(X, y)

resultado = export_text(decision_tree, feature_names=cabecalho)

# print(cabecalho)

conversor_vhdl.exportar_vhdl(resultado, cabecalho, y)