# Variables for MongoDB API resources
uniqueId=130785
resourceGroup="group$uniqueId"
location='uaenorth'
storageAccount="blob$uniqueId" 
funcApp="funcapp$uniqueId"

# # initiate local python environment
# pipenv shell
# pipenv install

# # initiate a local project folder
# func init function --python

# cd function

# # initiate a function
# func new --name QueueTrigger --template "Azure Service Bus Queue trigger" --language python

# func start

# Create a resource group
az group create -n $resourceGroup -l $location

# Create a storage account
az storage account create \
    --name $storageAccount \
    --resource-group $resourceGroup \
    --location $location

# Creat a function app
az functionapp create \
    --resource-group $resourceGroup \
    --name $funcApp \
    --storage-account $storageAccount \
    --os-type Linux \
    --consumption-plan-location $location \
    --runtime python

# Deploy the function 
# func azure functionapp publish funcapp130785