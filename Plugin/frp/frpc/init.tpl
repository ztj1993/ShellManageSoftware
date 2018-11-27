[common]
server_addr = <%=${SoftwareConfigs[server_addr]:=127.0.0.1}=%>
server_port = <%=${SoftwareConfigs[server_port]:=7000}=%>

admin_addr = <%=${SoftwareConfigs[admin_addr]:=127.0.0.1}=%>
admin_port = <%=${SoftwareConfigs[admin_port]:=7400}=%>
admin_user = <%=${SoftwareConfigs[admin_user]:=admin}=%>
admin_passwd = <%=${SoftwareConfigs[admin_passwd]:=$(date +%s%N | md5sum | head -c 5)}=%>

log_file = <%=${SoftwarePathData}=%>/frpc.log
log_level = <%=${SoftwareConfigs[log_level]:=info}=%>
log_max_days = <%=${SoftwareConfigs[log_max_days]:=3}=%>

token = <%=${SoftwareConfigs[token]:=$(date +%s%N | md5sum | head -c 5)}=%>

user = <%=${SoftwareConfigs[user]:=$(date +%s%N | md5sum | head -c 5)}=%>
