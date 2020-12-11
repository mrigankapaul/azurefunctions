# create a resource group
export resourceGroup="mriganka-rg"
export location="canadacentral"
az group create -n $resourceGroup -l $location

# choose a name for our function app
export functionAppName="mrigankafunc"

# to deploy our function app
az group deployment create -g $resourceGroup -f azuredeploy.json -p '{ "appName": {"value":"mrigankafunc"}}'


# see what's in the resource group we just created
az resource list -g $resourceGroup -o table

# check the app settings were configured correctly
az functionapp config appsettings list -n "mrigankafunc" -g $"mriganka-rg" -o table

# to clean up when we're done
az group delete -n $resourceGroup --no-wait -y
