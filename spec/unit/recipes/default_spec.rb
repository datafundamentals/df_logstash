#
# Cookbook Name:: df_logstash
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'df_logstash::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect(chef_run).to install_package('logstash')
  end
  it 'creates input config' do 
  	expect(chef_run).to create_template('/etc/logstash/conf.d/01-lumberjack-input.conf')
  end
  it 'creates syslog config' do 
  	expect(chef_run).to create_template('/etc/logstash/conf.d/10-syslog.conf')
  end
   it 'creates output config' do 
  	expect(chef_run).to create_template('/etc/logstash/conf.d/30-lumberjack-output.conf')
  end
  it 'adds logstash_ssl recipe' do 
  	expect(chef_run).to include_recipe("df_logstash::logstash_ssl")
    end
    it 'restarts logstash' do 
    	expect(chef_run).to restart_service('logstash') 
    end
  end
end
