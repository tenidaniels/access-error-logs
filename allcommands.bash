#Add or modify the logging directives: Inside the server block for api-nginx, add or verify the access_log and error_log directives. For example:
server {
    listen 80;
    server_name api-nginx.investnow.ng;

    access_log /var/log/nginx/api-nginx.access.log;
    error_log /var/log/nginx/api-nginx.error.log;

    location / {
        proxy_pass http://backend_servers;
    }
}



# Change Ownership to Nginx User Since Nginx typically runs under a specific user (often www-data), it would be best to change the ownership of both log files to that user. 
#This allows Nginx to write to them without permission issues. You can do this with the following commands:
sudo chown www-data:www-data /var/log/nginx/api-nginx.access.log
sudo chown www-data:www-data /var/log/nginx/api-nginx.error.log

#Set Permissions for Logs You may want to adjust the permissions of the log files to allow the Nginx user to write to them if necessary. You can set them as follows:
sudo chmod 664 /var/log/nginx/api-nginx.access.log
sudo chmod 664 /var/log/nginx/api-nginx.error.log
