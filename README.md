# ECR

* Easily store, share, and deploy your container software anywhere

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.18 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | terraform-aws-modules/ecr/aws | 3.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | provide an app-id | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | provide the aws\_region | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | provide some environment name | `string` | n/a | yes |
| <a name="input_notification_mail"></a> [notification\_mail](#input\_notification\_mail) | provide an email to send mails | `string` | n/a | yes |
| <a name="input_number_of_images"></a> [number\_of\_images](#input\_number\_of\_images) | number of images to keep in the ECR | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_arn"></a> [repository\_arn](#output\_repository\_arn) | Full ARN of the repository |
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | Name of the repository |
| <a name="output_repository_registry_id"></a> [repository\_registry\_id](#output\_repository\_registry\_id) | The registry ID where the repository was created |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the repository |
<!-- END_TF_DOCS -->

<!-- Terratest Executions -->
To run the infrastructure tests using Terratest, follow these steps:

1. Make sure you have Go installed on your system
2. Navigate to the terratests directory:
   ```bash
   cd terratests/
   ```

3. Download required Go dependencies:
   ```bash
   go mod tidy
   ```

4. Run the tests:
   ```bash
   go test -v
   ```

Note: Make sure you have valid AWS credentials configured before running the tests. The tests will create real AWS resources in your account for validation.
<!-- END Terratest Executions-->
