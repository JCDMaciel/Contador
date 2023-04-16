@echo off
setlocal enabledelayedexpansion

REM define o caminho para a pasta atual
set "folder=%~dp0"

REM define o caminho para o arquivo de lista de nomes de arquivos
set "list=%~dp0lista.txt"

REM inicializa a variável not_found como uma string vazia
set "not_found="

REM lê cada linha do arquivo de lista de nomes de arquivos e armazena o valor
for /f "delims=" %%a in ('type "%list%"') do (

    REM verifica se o arquivo não existe na pasta atual. Se não existir, o nome do arquivo é adicionado à variável
    if not exist "%folder%\%%a" (
        set "not_found=!not_found!%%a       "
    )
)

REM verifica se a variável not_found ainda é uma string vazia e imprime em um novo arquivo
if "%not_found%"=="" (
    echo Todos os arquivos da lista foram encontrados na pasta.
    echo Todos os arquivos da lista foram encontrados na pasta.>"%folder%\resultado.txt"
) else (
    echo Os seguintes arquivos nao foram encontrados:
    echo %not_found%
    echo Os seguintes arquivos nao foram encontrados:>%folder%\resultado.txt
    echo %not_found%>>"%folder%\resultado.txt"
)

pause