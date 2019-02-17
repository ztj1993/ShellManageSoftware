[Unit]
Description=<%=${AliasSoftware}=%>.<%=${AliasConfig}=%>
After=syslog.target
After=network.target

[Service]
Type=simple
User=<%=${SoftwareUserName}=%>
Group=<%=${SoftwareUserGroup}=%>
WorkingDirectory=<%=${SoftwarePathInstall}=%>
ExecStart=<%=${SoftwarePathInstall}=%>/filebrowser --config <%=${SoftwareConfigFile}=%>
Restart=always
Environment=USER=<%=${SoftwareUserName}=%> HOME=<%=${SoftwareUserHome}=%>

[Install]
WantedBy=multi-user.target
