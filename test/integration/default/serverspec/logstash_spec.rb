#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('logstash') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/log/logstash/logstash-plain.log') do
  it { should be_file }
#  its(:content) { should match /\[INFO\s*\]\[logstash\.setting\.writabledirectory\] Creating directory/ }
  its(:content) { should match /\[INFO\s*\].*Successfully started Logstash API endpoint/ }
  its(:content) { should_not match /\[ERROR\]/ }
end

