#!/bin/bash

# Definição das variáveis de ambiente para reutilização
RESOURCE_GROUP="rg-dimdim-dev"
LOCATION="eastus"
VM_NAME="vm-dimdim-app"
IMAGE="Ubuntu2404"
VM_SIZE="Standard_B2s"
ADMIN_USERNAME="admlnx"
ADMIN_PASSWORD="Fiap@2tdsvms"
VNET_NAME="nnet-Linux"
NSG_NAME="nsgsr-linux"
PUBLIC_IP_NAME="pip-linux"
PORT_HTTP=80
PORT_RANGE_START=5000
PORT_RANGE_END=5005
STORAGE_ACCOUNT_NAME="dimdimstorage$RANDOM" # Sufixo randômico para evitar conflito 
TAG_OWNER="DimDim"
TAG_PURPOSE="Training"

# Cabeçalho
echo "*************************************"
echo "  Script para criação de VM, Storage e configuração de monitoramento no Azure"
echo "*************************************"
echo ""

# Criar grupo de recursos
echo "Criando grupo de recursos '$RESOURCE_GROUP' na localização '$LOCATION'..."
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"
echo ""

# Mostrar informações do grupo de recursos criado
echo "Informações do grupo de recursos criado:"
az group show -n "$RESOURCE_GROUP" --query "{Name:name, Location:location, Tags:tags}" --output table
echo ""

# Listar imagens disponíveis para servidores Ubuntu focal (20.04)
echo "Listando imagens VM disponíveis para 'server-focal' da Canonical:"
az vm image list --offer "server-focal" --publisher canonical --sku "20_04-lts" --all -o table
echo ""

# Mostrar tamanhos de VM disponíveis para a localização
echo "Listando tamanhos de VM disponíveis para a localização '$LOCATION':"
az vm list-sizes --location "$LOCATION" -o table
echo ""

# Criar VM com as configurações definidas nas variáveis
echo "Criando VM '$VM_NAME' no grupo de recursos '$RESOURCE_GROUP'..."
az vm create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$VM_NAME" \
  --image "$IMAGE" \
  --size "$VM_SIZE" \
  --authentication-type password \
  --admin-username "$ADMIN_USERNAME" \
  --admin-password "$ADMIN_PASSWORD" \
  --vnet-name "$VNET_NAME" \
  --nsg "$NSG_NAME" \
  --public-ip-address "$PUBLIC_IP_NAME" \
  --tags "owner=$TAG_OWNER" "purpose=$TAG_PURPOSE"
echo ""

# Abrir a porta HTTP 80 na VM
echo "Abrindo a porta $PORT_HTTP para tráfego na VM '$VM_NAME'..."
az vm open-port --resource-group "$RESOURCE_GROUP" --name "$VM_NAME" --port "$PORT_HTTP" --priority 1001
echo ""

# Abrir intervalo de portas definido para a VM (para aplicações customizadas)
echo "Abrindo o intervalo de portas $PORT_RANGE_START-$PORT_RANGE_END na VM '$VM_NAME'..."
az vm open-port --resource-group "$RESOURCE_GROUP" --name "$VM_NAME" --port "$PORT_RANGE_START-$PORT_RANGE_END" --priority 1002
echo ""

# Criar uma conta de armazenamento com nome randômico para evitar conflito
echo "Criando conta de armazenamento '$STORAGE_ACCOUNT_NAME' no grupo de recursos '$RESOURCE_GROUP'..."
az storage account create \
  --name "$STORAGE_ACCOUNT_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2 \
  --access-tier Hot
echo ""

# Recuperar o ID da VM para usar nos comandos de monitoramento
VM_ID=$(az vm show -g "$RESOURCE_GROUP" -n "$VM_NAME" --query id -o tsv)

# Listar métricas de CPU da VM
echo "Listando métricas da VM '$VM_NAME' (Percentual Médio de CPU nos últimos 1 minuto):"
az monitor metrics list \
  --resource "$VM_ID" \
  --metric "Percentage CPU" \
  --aggregation Average \
  --interval PT1M -o table
echo ""

# Criar alerta para CPU alta (média acima de 90% durante 5 minutos)
echo "Criando alerta de monitoramento para CPU alta (média acima de 90% durante 5 minutos)..."
az monitor metrics alert create \
  -n "Alert-CPU-High" \
  -g "$RESOURCE_GROUP" \
  --scopes "$VM_ID" \
  --description "CPU acima de 90% por 5min" \
  --condition "avg Percentage CPU > 90"
echo ""

# Listar alertas de monitoramento configurados no grupo de recursos
echo "Listando alertas de monitoramento configurados no grupo de recursos '$RESOURCE_GROUP':"
az monitor metrics alert list -g "$RESOURCE_GROUP" -o table
echo ""

echo "Script finalizado com sucesso!"
