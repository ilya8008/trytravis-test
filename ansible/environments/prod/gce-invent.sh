#!/bin/bash
cd ../terraform/prod/
terraform state pull > temp-tfstate
terraform-inventory -list temp-tfstate
rm temp-tfstate
cd ../../ansible
