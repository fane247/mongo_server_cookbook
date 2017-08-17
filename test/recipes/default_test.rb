# # encoding: utf-8

# Inspec test for recipe mongo::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


describe port(27017) do
  	it { should be_listening }
end


describe package 'mongodb-org' do
	it { should be_installed}
end

describe service 'mongod' do
	it { should be_enabled }
end

describe service 'mongod' do
	it { should be_running }
end

