directory "#{node['df_logstash']['ssl_path']}/private" do 
	recursive true
	mode "0751"
	user "root"
	group "root"
end

directory "#{node['df_logstash']['ssl_path']}/certs" do 
	recursive true
	mode "0751"
	user "root"
	group "root"
	action :create
end

cookbook_file "#{node['df_logstash']['ssl_path']}/certs/logstash-forwarder.crt" do 
	source "logstash-forwarder.crt"
	mode "0644"
	owner "root"
	group "root" 
	action :create
end

cookbook_file "#{node['df_logstash']['ssl_path']}/private/logstash-forwarder.key" do 
	source "logstash-forwarder.key"
	mode "0644" 
	owner "root" 
	group "root" 
	action :create 
end


