# ======================================================
# ECR
# ======================================================

module "ecr" {
  source                          = "terraform-aws-modules/ecr/aws"
  version                         = "3.1.0"
  repository_name                 = "${var.aws_region}-${var.environment}-ecr"
  repository_image_tag_mutability = "MUTABLE"
  repository_image_scan_on_push   = true
  repository_force_delete         = true
  repository_encryption_type      = "AES256"
  create_lifecycle_policy         = false
}

resource "aws_ecr_lifecycle_policy" "ecr" {
  repository = module.ecr.repository_name
  policy     = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "This rule automatically deletes images older than ${var.number_of_images} versions to optimize storage and security.",
        "selection": {
          "tagStatus": "any",
          "countType": "imageCountMoreThan",
          "countNumber": ${var.number_of_images}
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
  EOF
}
