#!/bin/bash

# Obtem o diretorio do script atual, independentemente de onde o script foi chamado
folder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Define o caminho para o arquivo de lista de nomes de arquivos
list="$folder/lista.txt"

# Inicializa a variavel not_found como uma string vazia
not_found=""

# Le cada linha do arquivo de lista de nomes de arquivos e armazena o valor
while IFS= read -r arquivo; do
    # Verifica se o arquivo nao existe na pasta atual. Se nao existir, o nome do arquivo eh adicionado a variavel
    if [ ! -e "$folder/$arquivo" ]; then
        not_found="$not_found$arquivo"
    fi
done < "$list"

# Verifica se a variavel not_found ainda eh uma string vazia e imprime em um novo arquivo
if [ -z "$not_found" ]; then
    echo "Todos os arquivos da lista foram encontrados na pasta."
    echo "Todos os arquivos da lista foram encontrados na pasta." > "resultado.txt"
else
    echo "Os seguintes arquivos nao foram encontrados:"
    echo "$not_found"
    echo "Os seguintes arquivos nao foram encontrados:" > "resultado.txt"
    echo "$not_found" >> "resultado.txt"
fi
