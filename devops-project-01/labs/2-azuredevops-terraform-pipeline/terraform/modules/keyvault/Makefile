.POSIX:

.PHONY: all
all: format validate

.PHONY: format
format:
	terraform fmt

.PHONY: validate
validate:
	terraform fmt --check
	terraform init -upgrade
	terraform validate -no-color

.SILENT .PHONY: docs
docs: # Generate documentation with `terraform-docs`
		terraform-docs \
			--config ".terraform-docs.yml" \
			.

.SILENT .PHONY: pre-commit
pre-commit: # Runs pre-commit checks with `pre-commit`
		pre-commit \
			run \
				--all-files
