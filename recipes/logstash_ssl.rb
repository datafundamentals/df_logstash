directory "/etc/pki/tls/private" do 
	recursive true
	mode "0751" 
end

directory "/etc/pki/tls/certs" do 
	mode "0751" 
end

template "/etc/ssl/openssl.conf" do 
	source "openssl.conf.erb" 
	mode "0644" 
	action :create
end

execute "create ssl cert" do 
	command "openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout /etc/pki/tls/private/logstash-forwarder.key -out /etc/pki/tls/certs/logstash-forwarder.crt"
	action :run
	not_if do ::File.exists?("etc/pki/tls/certs/logstash-forwarder.crt") end
end

