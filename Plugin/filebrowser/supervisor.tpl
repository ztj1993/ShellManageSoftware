[program:<%=${AliasSoftware}=%>.<%=${AliasConfig}=%>]
directory=<%=${SoftwarePathInstall}=%>
command=<%=${SoftwarePathInstall}=%>/filebrowser --config <%=${SoftwareConfigFile}=%>
autostart=false
autorestart=false
startsecs=10
stdout_logfile=/var/log/supervisor/<%=${AliasSoftware}.${AliasConfig}=%>.stdout.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10
stdout_capture_maxbytes=1MB
stderr_logfile=/var/log/supervisor/<%=${AliasSoftware}.${AliasConfig}=%>.stderr.log
stderr_logfile_maxbytes=1MB
stderr_logfile_backups=10
stderr_capture_maxbytes=1MB
user = <%=${SoftwareUserName}=%>
environment = HOME="<%=${SoftwareUserHome}=%>", USER="<%=${SoftwareUserName}=%>"
