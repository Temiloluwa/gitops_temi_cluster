key_pair_name=hifeyinc-cluster-key
key_pair_file_path=hifeyinc-cluster-key.pem
terraform plan -var="key_pair_name=$key_pair_name" -var="key_pair_file_path=$key_pair_file_path"
terraform apply -var="key_pair_name=$key_pair_name" -var="key_pair_file_path=$key_pair_file_path" -auto-approve