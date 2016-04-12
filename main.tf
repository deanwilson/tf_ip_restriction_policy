# template to expand ip restriction policy
resource "template_file" "restrict_ip" {
    template = "${file("${path.module}/templates/restrict-to-ip.json.tpl")}"

    vars {
        allowed_ranges = "${var.allowed_cidr_ranges}"
    }
}


resource "aws_iam_policy" "restrict_ip_policy" {
    name = "${var.group_name}-restrict-ip-policy"
    description = "Restricted IP access for users in ${var.group_name}"
    policy = "${template_file.restrict_ip.rendered}"
}


resource "aws_iam_policy_attachment" "require_office_ip" {
  name = "require_govuk_ip_address"
  groups = [
    "${var.group_name}",
  ]
  policy_arn = "${aws_iam_policy.restrict_ip_policy.arn}"
}
