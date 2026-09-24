# AVD access request

This repository captures the inputs used to route an AVD request. It intentionally
does not assign a user or deploy Azure resources yet.

## Decision record

- **Requester:** eric.wagner@chipotle.com
- **User:** eric.wagner@chipotle.com
- **Use case:** Testing
- **Applications:** Development tools
- **Access duration:** Temporary
- **OS-level administrator rights:** true
- **Host pool override:** None; use the decision matrix
- **Review notes:** derp

## Initial routing rule

Miscellaneous and contractor requests default to the `cmg-contractors` host
pool because it is the simplest segregated environment. The final host pool
must be reviewed against the current CMG Host Pool Overview before access is
assigned.

## Next automation boundary

The current manual assignment happens in Nerdio: an operator finds an
unassigned host and uses **Manage Assigned User**. The generated `request.json` and Terraform files are for review and linting only.
A future implementation should
keep this operational assignment separate from Terraform infrastructure state.

## Terraform

```sh
terraform fmt -check -recursive terraform
terraform init -backend=false terraform
terraform validate terraform
```
