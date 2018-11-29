appname = <%=${SoftwareConfigs[appname]:=MinDoc}=%>
httpaddr = <%=${SoftwareConfigs[httpaddr]:=0.0.0.0}=%>
httpport = <%=${SoftwareConfigs[httpport]:=8181}=%>
runmode = <%=${SoftwareConfigs[runmode]:=dev}=%>
sessionon = true
sessionname = mindoc_id
copyrequestbody = <%=${SoftwareConfigs[runmode]:=true}=%>

beegoserversessionkey = <%=${SoftwareConfigs[beegoserversessionkey]:=$(date +%s%N | md5sum | head -c 15)}=%>
sessionprovider = file
sessionproviderconfig = <%=${SoftwarePathData}=%>/runtime/session

timezone = Asia/Shanghai

db_adapter = <%=${SoftwareConfigs[db_adapter]:=sqlite3}=%>
db_host = <%=${SoftwareConfigs[db_host]:=127.0.0.1}=%>
db_port = <%=${SoftwareConfigs[db_port]:=3306}=%>
db_database = <%=${SoftwareConfigs[db_database]:=${SoftwarePathData}/database/mindoc.db}=%>
db_username = <%=${SoftwareConfigs[db_username]:=root}=%>
db_password = <%=${SoftwareConfigs[db_password]}=%>

cover = /static/images/book.jpg
avatar = /static/images/headimgurl.jpg
token_size = 12
upload_file_ext = txt|doc|docx|xls|xlsx|ppt|pptx|pdf|7z|rar|jpg|jpeg|png|gif
upload_file_size = 10MB

enable_export = <%=${SoftwareConfigs[enable_export]:=false}=%>
export_output_path = <%=${SoftwarePathData}=%>/runtime/cache

log_path = <%=${SoftwarePathData}=%>/runtime/logs
log_maxdays = <%=${SoftwareConfigs[log_maxdays]:=30}=%>
log_level =  <%=${SoftwareConfigs[log_level]:=Warning}=%>
