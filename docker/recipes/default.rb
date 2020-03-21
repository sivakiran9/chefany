#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute "run apt-get update command" do
  command "sudo apt-get update"
end

execute "Install docker dependencies" do
  command "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common"
end

execute "Import the repository’s GPG key using the following curl command" do
  command "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
end

execute "Add the Docker APT repository to your system" do 
  command 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"'
end 

execute "Install Latest version of Docker" do 
  command "sudo apt-get -y install docker-ce"
end

execute "Add your user to this group " do 
  command "sudo usermod -aG docker ubuntu"
end
