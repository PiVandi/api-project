## Pipelines

name: terraform-deploy

on:
  push:
    branches: [ "main" ]

jobs:
  terraform:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v3

      - name: Azure Login
        uses: azure/login@v2
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan

      - name: Terraform Apply
        run: terraform apply -auto-approve

name: build-image

on:
  push:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Azure Login
        uses: azure/login@v2
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}

      - name: Login to ACR
        run: az acr login --name demoregistry123

      - name: Build Docker image
        run: docker build -t demoregistry123.azurecr.io/api:latest .

      - name: Push Docker image
        run: docker push demoregistry123.azurecr.io/api:latest

## Authentication
 - kann man API Key ausgeben?


## Variablen 
 - wie werden environment Variablen injected?
 - Post_Gres URI im Container nicht vergessen -> muss env Variable sein