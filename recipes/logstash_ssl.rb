directory "#{node['df_logstash']['ssl_path']}/private" do 
	recursive true
	mode "0751" 
end

directory "#{node['df_logstash']['ssl_path']}/certs" do 
	recursive true
	mode "0751" 
end

template "/etc/ssl/openssl.conf" do 
	source "openssl.conf.erb" 
	mode "0644" 
	action :create
end

execute "create ssl cert" do 
	command "openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout #{node['df_logstash']['ssl_path']}/private/logstash-forwarder.key -out #{node['df_logstash']['ssl_path']}/certs/logstash-forwarder.crt"
	action :run
	not_if do ::File.exists?("#{node['df_logstash']['ssl_path']}/logstash-forwarder.crt") end
end

