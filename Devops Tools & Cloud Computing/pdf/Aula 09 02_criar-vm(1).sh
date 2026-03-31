#!/bin/bash

# Variáveis
RESOURCE_GROUP="rg-docker"
LOCATION="SuaRegiao"
VM_NAME="vm-docker"
IMAGE="dockerinc1694120899427:devbox_azuremachine:devboxlicensefpromo:4.41.2"

# Comando para procurar a imagem no Marketplace
# az vm image list --all -p docker -o table
#
SIZE="Standard_D2s_v3"
# 2 vcpus, 8 GiB de memória
ADMIN_USERNAME="rm9999"
ADMIN_PASSWORD="Fiap@2tdsvms"
DISK_SKU="StandardSSD_LRS"
# 127 GB
PORT=3389
SHUTDOWN_TIME="0230" ## Deve ser o UTC (Brasil está a -3 horas) / Ese exeplo desliga a VM às 23:30h horário de Brasília

# Criar grupo de recursos
echo "Criando grupo de recursos: $RESOURCE_GROUP..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Aceitar os Termos legais da Imagem
echo "Aceitando os Termos Legais da Imagem..."
az vm image terms accept --urn $IMAGE

# Criar a VM
echo "Criando a máquina virtual: $VM_NAME..."
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --image $IMAGE \
  --size $SIZE \
  --authentication-type password \
  --admin-username $ADMIN_USERNAME \
  --admin-password $ADMIN_PASSWORD \
  --storage-sku $DISK_SKU \
  --public-ip-sku Standard

# Abrir a porta RDP
echo "Abrindo porta $PORT para RDP..."
az vm open-port --port $PORT --resource-group $RESOURCE_GROUP --name $VM_NAME

# Ativar desligamento automático
echo "Configurando desligamento automático às $SHUTDOWN_TIME (UTC)..."
az vm auto-shutdown \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --time $SHUTDOWN_TIME

echo "Provisionamento completo!"
