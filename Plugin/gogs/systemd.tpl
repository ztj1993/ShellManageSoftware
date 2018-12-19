[Unit]
Description=<%=${AliasSoftware}=%>.<%=${AliasConfig}=%>
After=syslog.target
After=network.target
After=mariadb.service mysqld.service postgresql.service memcached.service redis.service

[Service]
Type=simple
User=<%=${SoftwareUserName}=%>
Group=<%=${SoftwareUserGroup}=%>
WorkingDirectory=<%=${SoftwarePathInstall}=%>
ExecStart=<%=${SoftwarePathInstall}=%>/gogs web --config <%=${SoftwareConfigFile}=%>
Restart=always
Environment=USER=<%=${SoftwareUserName}=%> HOME=<%=${SoftwareUserHome}=%>

[Install]
WantedBy=multi-user.target
