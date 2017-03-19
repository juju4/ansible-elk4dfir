#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('kibana') do
  it { should be_enabled }
  it { should be_running }
end

describe process("node") do
  it { should be_running }
  its(:user) { should eq "kibana" }
  its(:args) { should match /-c \/etc\/kibana\/kibana.yml/ }
end

describe file('/var/log/kibana/kibana.log') do
  it { should be_file }
  its(:content) { should match /"state":"green","message":"Status changed from uninitialized to green - Ready"/ }
  its(:content) { should_not match /"warning"/ }
  its(:content) { should_not match /"error"/ }
end

