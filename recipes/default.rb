#
# Cookbook:: Jenkins
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
execute 'add key for fetching repo' do
  command "wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -"
end

execute 'add jenkins source to list' do
  command "sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'"
end

apt_update "update_sources" do
  action :update
end

package 'jenkins' do
  action :install
end
