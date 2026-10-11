resource "google_healthcare_dataset_iam_member" "healthcare_dataset_iam_members" {
  for_each = var.healthcare_dataset_iam_members

  dataset_id = each.value.dataset_id
  member     = each.value.member
  role       = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

