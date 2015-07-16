apt_repository "logstash-forwarder" do 
	uri "deb http://packages.elasticsearch.org/logstashforwarder/debian stable main"
	key "http://packages.elasticsearch.org/GPG-KEY-elasticsearch" 
end

apt_package "logstash-forwarder" do 
	action :install
end

template "/etc/logstash-forwarder.conf" do 
	source "logstash-forwarder.conf.erb" 
	mode "0664" 
end
 service "logstash-forwarder" do 
 	action :restart
 end
 