{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Deny",
        "Action": "*",
        "Resource": "*",
        "Condition": {
            "NotIpAddress": {
                "aws:SourceIp": [
                    ${ join(",", formatlist("\"%s\"", split(",", allowed_ranges))) }
                ]
            }
        }
    }
}
