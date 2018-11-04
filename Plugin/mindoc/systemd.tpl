[Unit]
Description=<%=${AliasSoftware}=%>.<%=${AliasConfig}=%>
After=syslog.target
After=network.target
After=mariadb.service mysqld.service postgresql.service memcached.service redis.service

[Service]
Type=simple
User=<%=${SoftwareUser}=%>
Group=<%=${SoftwareGroup}=%>
WorkingDirectory=<%=${SoftwarePathInstall}=%>
ExecStart=<%=${SoftwarePathInstall}=%>/mindoc_linux_amd64 -config=<%=${SoftwareConfigFile}=%>
Restart=always
Environment=USER=<%=${SoftwareUser}=%> HOME=/home/<%=${SoftwareUser}=%>

[Install]
WantedBy=multi-user.target
