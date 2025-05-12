# Deploying Terraform Using Azure DevOps

The purpose of this lab is to create all of the Azure cloud services you'll need from an environment/infrastructure perspective to run the test application.

I have created modules to deploy the Terraform infrastructure
- [Azure Container Registry](https://github.com/jorgepezuela/devops-projects/tree/develop/devops-project-01/labs/2-azuredevops-terraform-pipeline/terraform/modules/acr)
- [Azure Virtual Network](https://github.com/jorgepezuela/devops-projects/tree/develop/devops-project-01/labs/2-azuredevops-terraform-pipeline/terraform/modules/vnet)
- [Azure Kubernetes Service](https://github.com/jorgepezuela/devops-projects/tree/develop/devops-project-01/labs/2-azuredevops-terraform-pipeline/terraform/modules/aks)
- [Azure Log Analytics](https://github.com/jorgepezuela/devops-projects/tree/develop/devops-project-01/labs/2-azuredevops-terraform-pipeline/terraform/modules/log-analytics)
- [Azure Key Vault](https://github.com/jorgepezuela/devops-projects/tree/develop/devops-project-01/labs/2-azuredevops-terraform-pipeline/terraform/modules/keyvault)
- [Azure Subnet](https://github.com/jorgepezuela/devops-projects/tree/develop/devops-project-01/labs/2-azuredevops-terraform-pipeline/terraform/modules/snet)

In this lab, you will:
- Review Terraform modules mentioned above
- Terraform .tfvars are going to be used, review accordingly
- Deploy terraform using provided Azure DevOps pipeline
