#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('elasticsearch') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/log/elasticsearch/elasticsearch.log') do
  it { should be_file }
  its(:content) { should match /\[INFO\s*\].* started/ }
  its(:content) { should_not match /\[ERROR\]/ }
end

