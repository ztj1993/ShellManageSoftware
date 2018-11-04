[common]
bind_addr = <%=${SoftwareConfigs[bind_addr]}=%>
bind_port = <%=${SoftwareConfigs[bind_port]}=%>

dashboard_addr = <%=${SoftwareConfigs[dashboard_addr]}=%>
dashboard_port = <%=${SoftwareConfigs[dashboard_port]}=%>
dashboard_user = <%=${SoftwareConfigs[dashboard_user]}=%>
dashboard_pwd = <%=${SoftwareConfigs[dashboard_pwd]}=%>

log_file = <%=${SoftwarePathData}=%>/frps.log
log_level = info
log_max_days = 3

token = <%=${SoftwareConfigs[token]}=%>
