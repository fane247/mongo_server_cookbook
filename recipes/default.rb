#
# Cookbook Name:: mongo
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.



apt_repository 'mongodb-org' do
	components ["multiverse"]
	distribution "xenial/mongodb-org/3.2"
	keyserver "hkp://keyserver.ubuntu.com:80"
	key "EA312927"
	uri "http://repo.mongodb.org/apt/ubuntu"
end

package 'mongodb-org'

template "/lib/systemd/system/mongod.service" do
	source 'mongod.service.erb'
	owner 'root'
	group 'root'
	mode '0755'
	notifies :restart, 'service[mongod]'
end

template "/etc/mongod.conf" do
	source 'mongod.conf.erb'
	owner 'root'
	group 'root'
	mode '0755'
	notifies :restart, 'service[mongod]'
end

service "mongod" do
	action [:start, :enable]
	supports start: true, restart: true, reload: true
end



