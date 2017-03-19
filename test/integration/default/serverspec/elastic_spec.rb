#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('elasticsearch') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9200) do
  it { should be_listening.with('tcp6') }
end
describe port(9300) do
  it { should be_listening.with('tcp6') }
end

describe file('/var/log/elasticsearch/elasticsearch.log') do
  it { should be_file }
  its(:content) { should match /\[INFO\s*\].* starting \.\.\./ }
  its(:content) { should match /\[INFO\s*\].* started/ }
  its(:content) { should_not match /\[ERROR\]/ }
end

