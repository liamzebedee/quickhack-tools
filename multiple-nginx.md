Multiple servers for different domains on the same host. An example

```
server {
	listen 80;
	server_name liamz.co;
	root /var/www/liamz.co;
error_log /root/liamz.co.log debug;
}



server {
	listen   80; ## listen for ipv4; this line is default and implied
	server_name dropinuts.com;   
#listen   [::]:80 default ipv6only=on; ## listen for ipv6

error_log /root/dropinuts.com.log debug;
#    root /root/dropin;
#    index index.html index.htm;

    location / {
        proxy_pass http://localhost:3000;
    }

   
}
```
