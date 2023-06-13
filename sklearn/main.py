from sklearn import tree
from sklearn.tree import export_text
import os

def coletarCabecalho(caminho):
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

            for i in range(len(atributos)):
                atributos[i] = atributos[i].strip('"')
                try:
                    atributos[i]=float(atributos[i])
                except:
                    atributos[i]=atributos[i]
                if indice_target == i:
                    y.append(atributos[i])
                else:
                    valores.append(atributos[i])
            X.append(valores)
    
    return X, y
 
target = "Diabetes"
caminho = os.path.abspath(os.getcwd()) + "\\" + "diabetes.csv"

cabecalho = coletarCabecalho(caminho)
X, y = separarDados(caminho, target, cabecalho)

decision_tree = tree.DecisionTreeClassifier()
decision_tree = decision_tree.fit(X, y)

cabecalho.remove(target)

r = export_text(decision_tree, feature_names=cabecalho)
print(r)