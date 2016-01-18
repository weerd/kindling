# Additional Notes

***


Need to look into what the `gzinflate()` issue when WordPress performs its initial install process. For further info can refer to [http://php.net/manual/en/function.gzinflate.php].

```shell
# http://askubuntu.com/a/432408

# create the configuration file in the "available" section
$ echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/servername.conf
# enable it by creating a symlink to it from the "enabled" section
$ sudo a2enconf servername
# restart the server
$ sudo service apache2 restart
```

Prior to setting up a WordPress installation for local development, need to make sure that the server name is set up if planning on using a name instead of an IP.