# Current version
# VERSION ?= 1.0.3

.DEFAULT_GOAL:=help

CURDIR  := $(notdir $(CURDIR))
PATH    := $(PATH):$(PWD)/bin
OS       = $(shell uname -s | tr '[:upper:]' '[:lower:]')
ARCH     = $(shell uname -m | sed 's/x86_64/amd64/')
OSOPER   = $(shell uname -s | tr '[:upper:]' '[:lower:]' | sed 's/darwin/apple-darwin/' | sed 's/linux/linux-gnu/')
ARCHOPER = $(shell uname -m )
TFSTATE  = $(CURDIR)_$(dir)_$(env).tfstate

.PHONY: help requirements validate security lint providers apply

help:  ##   Display this help

		@echo " ----------------------------------------------------------------------"
		@echo "|                                                                      |"
		@echo "| Example                                                              |"
		@echo "| =======                                                              |"
		@echo "|                                                                      |"
		@echo "| make env=<env> dir=<component> apply                                 |"
		@echo "|                                                                      |"
		@echo " ----------------------------------------------------------------------"


		@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

all: validate security lint

.PHONY: validate
validate: ##   Validate Code
		$(info Make: Validate Format and Code)
		@terraform -chdir=$(dir) init -input=false -backend=false -upgrade
		@terraform -chdir=$(dir) fmt --check
		@terraform -chdir=$(dir) validate -no-color

.PHONY: init
init: clean check ##   Initialize Terraform
		$(info Make: Terraform init)
		@terraform -chdir=$(dir) init -upgrade \
		-backend-config="key=$(TFSTATE)"

.PHONY: check
check: ##   Check Variables
		$(info Make: Check Variables)
		@[ "${env}" ] || ( echo "\033[36menv\033[0m is not set"; exit 1 )
		@[ "${dir}" ] || ( echo "\033[36mdir\033[0m is not set"; exit 1 )

.PHONY: clean
clean: check ##   Clean Stuff
		$(info Make: Clean Stuff)
		@rm -rf $(dir)/.terraform*
		@rm -rf $(dir)/plan.out

.PHONY: plan
plan: init ##   Plan Terraform
		$(info Make: Plan Terraform)
		@terraform -chdir=$(dir) plan -var-file="../env/$(env).tfvars" -out plan.out

.PHONY: apply
apply: init ##   Create Infrastructure - Run with 'make env=dev apply'
		$(info Make: Apply Terraform)
		@terraform -chdir=$(dir) apply -var-file="../env/$(env).tfvars" $(args)

.PHONY: destroy
destroy: init ##   Destroy Infrastructure - Run with 'make env=dev destroy'
		$(info Make: Destroy Terraform)
		@terraform -chdir=$(dir) destroy -var-file="../env/$(env).tfvars" $(args)
