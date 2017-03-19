#require 'spec_helper'
require 'serverspec'

# Required by serverspec
set :backend, :exec

#describe service('monit') do
#  it { should be_enabled }
#  it { should be_running }
#end
#
#describe service('nginx'), :if => os[:family] == 'redhat' do
#  it { should be_enabled }
#  it { should be_running }
#end
#
#describe service('nginx'), :if => os[:family] == 'ubuntu' do
#  it { should be_enabled }
#  it { should be_running }
#end
#
#describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
#  it { should be_enabled }
#  it { should be_running }
#end
#
#describe port(80) do
#  it { should be_listening }
#end

describe process("java") do
  it { should be_running }
## FIXME! matching w multiple process to review
#  its(:user) { should eq "elasticsearch" }
#  its(:user) { should eq "elasticsearch" or should eq "logstash" }
#  its(:args) { should match /elasticsearch-/ }
end

describe port(5601) do
  it { should be_listening }
end

describe port(9200) do
  it { should be_listening }
end

describe port(9300) do
  it { should be_listening }
end

## https://www.elastic.co/guide/en/logstash/current/config-examples.html
## a bit slow command ~15sec
#describe command('echo \'127.0.0.1 - - [11/Dec/2013:00:01:45 -0800] "GET /xampp/status.php HTTP/1.1" 200 3891 "http://cadenza/xampp/navi.php" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:25.0) Gecko/20100101 Firefox/25.0"\' | /opt/logstash/bin/logstash -f /etc/logstash/conf.d/simple.conf') do
#  its(:stdout) { should contain('"message" => "127.0.0.1') }
#end

