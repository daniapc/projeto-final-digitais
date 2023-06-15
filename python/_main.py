import os
import gerenciador_dados

from sklearn import tree
from sklearn.tree import export_text
from sklearn.preprocessing import OneHotEncoder
 
dataset = "titanic.csv"
caminho = os.path.abspath(os.getcwd()) + "\\datasets\\" + dataset
target = "Survived"
cabecalho = gerenciador_dados.getCabecalho(caminho)
profundidade = 5

X, y = gerenciador_dados.separarDados(caminho, target, cabecalho)
cabecalho.remove(target)

indices_categoricos,campos_categoricos,cabecalho_categoricos = gerenciador_dados.getCategoricos(X, cabecalho)

if len(campos_categoricos) != 0:
    encoder = OneHotEncoder(handle_unknown='ignore')
    encoder = encoder.fit(campos_categoricos)
    array_categorico = encoder.transform(campos_categoricos).toarray()
    X = gerenciador_dados.reincluirCategoricosTransformados(X, array_categorico.tolist())
    cabecalho = gerenciador_dados.incluirCabecalhoCategoricos(encoder,cabecalho,cabecalho_categoricos)

decision_tree = tree.DecisionTreeClassifier(max_depth=profundidade)
decision_tree = decision_tree.fit(X, y)

r = export_text(decision_tree, feature_names=cabecalho)

print(r)