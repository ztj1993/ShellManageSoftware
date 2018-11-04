[Unit]
Description=<%=${AliasSoftware}=%>.<%=${AliasConfig}=%>
After=syslog.target
After=network.target

[Service]
Type=simple
User=<%=${SoftwareUser}=%>
Group=<%=${SoftwareGroup}=%>
WorkingDirectory=<%=${SoftwarePathInstall}=%>
ExecStart=<%=${SoftwarePathInstall}=%>/frpc -c=<%=${SoftwareConfigFile}=%>
Restart=always
Environment=USER=<%=${SoftwareUser}=%> HOME=/home/<%=${SoftwareUser}=%>

[Install]
WantedBy=multi-user.target
