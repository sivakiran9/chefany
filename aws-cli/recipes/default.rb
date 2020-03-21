#
# Cookbook:: aws-cli
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute "run apt-get update command" do
  command "sudo apt-get update"
end

execute "Install python3" do 
  command "sudo apt install -y python3-pip"
end

execute "Install aws cli" do
  command "pip3 install awscli --upgrade --user"
end

execute "install awscli" do 
  command "sudo apt install -y awscli"
end
#directory 'sk' do
#  recursive true
#  action :'create'
#end


directory '/home/ubuntu/.aws' do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  action :create
end

template("/.aws/credentials") do
provider Chef::Provider::Template
action "create"
retries 0
retry_delay 2
path "/.aws/credentials"
backup 5
atomic_update true
source "credentials.erb"
cookbook_name "aws-cli"
recipe_name "default"
mode "0644"
owner "ubuntu"
group "ubuntu"
end
