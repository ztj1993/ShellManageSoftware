[common]
server_addr = <%=${SoftwareConfigs[server_addr]}=%>
server_port = <%=${SoftwareConfigs[server_port]}=%>

admin_addr = <%=${SoftwareConfigs[admin_addr]}=%>
admin_port = <%=${SoftwareConfigs[admin_port]}=%>
admin_user = <%=${SoftwareConfigs[admin_user]}=%>
admin_passwd = <%=${SoftwareConfigs[admin_passwd]}=%>

log_file = <%=${SoftwarePathData}=%>/frpc.log
log_level = info
log_max_days = 3

token = <%=${SoftwareConfigs[token]}=%>

user = <%=${SoftwareConfigs[user]}=%>
