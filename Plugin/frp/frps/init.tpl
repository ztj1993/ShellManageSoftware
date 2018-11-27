[common]
bind_addr = <%=${SoftwareConfigs[bind_addr]:=0.0.0.0}=%>
bind_port = <%=${SoftwareConfigs[bind_port]:=7000}=%>

dashboard_addr = <%=${SoftwareConfigs[dashboard_addr]:=0.0.0.0}=%>
dashboard_port = <%=${SoftwareConfigs[dashboard_port]:=7500}=%>
dashboard_user = <%=${SoftwareConfigs[dashboard_user]:=admin}=%>
dashboard_pwd = <%=${SoftwareConfigs[dashboard_pwd]:=$(date +%s%N | md5sum | head -c 5)}=%>

log_file = <%=${SoftwarePathData}=%>/frps.log
log_level = <%=${SoftwareConfigs[log_level]:=info}=%>
log_max_days = <%=${SoftwareConfigs[log_max_days]:=3}=%>

token = <%=${SoftwareConfigs[token]:=$(date +%s%N | md5sum | head -c 5)}=%>
