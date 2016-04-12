# Restrict User Access to Given IP Ranges

## Introduction

This Terraform module creates an IAM policy that only allows requests
to come from a defined list of IP ranges. This means that if a user
who is in the restricted group exposes their access keys (by uploading
them to GitHub for example) then the attacker cannot successfully use
them to make requests unless they can make their requests from an
approved IP range.

The initial code and all of the idea were taken from the GOV.UK Platform
As a Service team. I've extracted it in to a module to enable reuse
internally and for my own use externally as it's such an excellent idea.

## Usage

    module "locked-down-users" {
        source = "github.com/deanwilson/tf_ip_restriction_policy"

        # only requests from these ranges
        allowed_cidr_ranges = "10.10.100.10/24,10.10.200.10/24"
        # will succeed for users in this group
        group_name = "locked-down-users"
    }

### Module Input Variables

 * `allowed_cidr_ranges`
  * A comma separated list of IP address ranges to allow access from
  * defaults to `"0.0.0.0/0"` which allows everything

 * `group_name`
  * The group name the policy should be attached to

#### Author
[Dean Wilson](http://www.unixdaemon.net) wrote this module. The
excellent original code and idea comes from the GOV.UK Platform As a
Service team.
