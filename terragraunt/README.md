## Terragrunt

### Terragrunt Documentation
* [Documentation](https://terragrunt.gruntwork.io/docs/)

* [Execute Terraform commands on multiple modules at once](https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/#dependencies-between-modules)

* [Configuration Blocks and Attributes](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency)


## Terragrunt Commands
* When running a terragrunt apply, what is the difference between terragrunt apply `-auto-approve` vs `terragrunt apply` `--terragrunt-non-interactive`?

* `-auto-approve` skips interactive prompts from Terraform, such as the prompt to check the plan output before running apply. `--terragrunt-non-interactiveskips` interactive prompts from Terragrunt, such as the prompt to create an S3 bucket as a state backend if the bucket doesn't exist already.

### From each Module
```
terragrunt init
terragrunt plan
terragrunt apply
terragrunt destroy
terragrunt apply --terragrunt-non-interactive
terragrunt destroy --terragrunt-non-interactive
```

### From a root module
```
terragrunt plan-all
terragrunt apply-all
terragrunt destroy-all
terragrunt apply-all --terragrunt-non-interactive
terragrunt destroy-all --terragrunt-non-interactive
```



