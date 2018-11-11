#!/bin/bash
cd ../terraform/stage/
terraform state pull > temp-tfstate
terraform-inventory -list temp-tfstate
rm temp-tfstate
cd ../../ansible
