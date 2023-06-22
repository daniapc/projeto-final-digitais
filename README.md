# Projeto Final Circuitos Digitais
Projeto Final para a disciplina de Circuitos Digitais realizado durante o semestre de 2023.1 na UTFPR. O código foi idealizado para rodar tanto no Windows quanto no Linux.

## Informações:
A ideia é desenvolver um código que, dados uma base de dados e um alvo de predições, converta em VHDL a saída de um algoritmo de Machine Learn de Árvore de Decisão utilizando o Framework Scikit-learn. Assim, bastando criar um símbolo e compilar o programa, o usuário tem acesso a uma interface Digital na placa 10M50DAF484C7G para realizar predições conforme cinco atributos fornecidos de entrada.

## Instalação:
As instruções a seguir referem-se apenas a quem estiver usando Windows. Para o Linux os procedimentos podem ser análogos.

* Verifique se o seu computador possui Python 3 instalado.
```
py --version
```
Caso contrário, seguir os procedimentos no link: https://www.python.org/downloads/

* Verifique se o seu computador possui pip instalado.
```
py -m pip -V
```
Caso contrário, seguir os procedimentos no link: https://packaging.python.org/pt_BR/latest/guides/installing-using-pip-and-virtual-environments/

* Verifique se o seu computador possui Scikit-Lean instalado.
```
py -m pip show scikit-learn
```
Caso contrário, seguir os procedimentos no link: https://scikit-learn.org/stable/install.html

* Verifique se o seu computador possui Quartus instalado. Caso contrário, seguir os procedimentos no link: https://www.intel.com/content/www/us/en/software-kit/773998/intel-quartus-prime-lite-edition-design-software-version-22-1-1-for-windows.html?

## Como rodar:
* Em um diretório qualquer, clone esse repositório com o comando:
```
git clone https://github.com/daniapc/projeto-final-digitais.git
```

* No diretório projeto-final-digitais/python/datasets, coloque a base de dados desejada (em csv).

* No diretório projeto-final-digitais/python/, rode o código:
```
py _main.py
```

* Forneça os dados solicitados. Caso deixar algum em branco, automaticamente será utilizada a base diabetes.csv e o target Diabetes. O arquivo infos.txt presente na pasta /out/ é relevante para informar o atributo com seu respectivo número, bem como o significado dos campos categóricos.

* No diretório projeto-final-digitais/quartus, abra o arquivo do projeto projeto-final.qpf.

* Com o ambiente do quartus aberto, crie um símbolo para o arquivo recentemente modificado atributos.vhdl.

* Compile o projeto e programe-o na placa, seguindo o arquivo anteriormente mencionado.