#!/bin/bash

# Cabeçalho de boas-vindas
echo "*************************************"
echo "Bem-vindo à Missão DimDim nas Nuvens!"
echo "*************************************"
echo ""

# Verificar se o Azure CLI está instalado e mostrar a versão
echo "Verificando se o Azure CLI está instalado e exibindo a versão..."
az --version
echo ""

# Solicitar que o usuário faça login no Azure
echo "Por favor, faça seu login no Azure:"
az login
echo ""

# Exibir as assinaturas disponíveis para a conta logada, no formato tabela
echo "Obtendo a lista de suas assinaturas Azure:"
az account list --output table
echo ""
