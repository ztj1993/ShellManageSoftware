APP_NAME = <%=${SoftwareConfigs[APP_NAME]:=Gogs}=%>
RUN_USER = <%=${SoftwareUser}=%>
RUN_MODE = prod

[database]
DB_TYPE = <%=${SoftwareConfigs[DB_TYPE]:=sqlite3}=%>
HOST = <%=${SoftwareConfigs[HOST]:=127.0.0.1:3306}=%>
NAME = <%=${SoftwareConfigs[NAME]:=gogs}=%>
USER = <%=${SoftwareConfigs[USER]:=root}=%>
PASSWD = <%=${SoftwareConfigs[PASSWD]}=%>
SSL_MODE = <%=${SoftwareConfigs[SSL_MODE]:=disable}=%>
PATH = <%=${SoftwarePathData}=%>/gogs.db

[repository]
ROOT = <%=${SoftwarePathData}=%>/repositories

[server]
PROTOCOL = <%=${SoftwareConfigs[PROTOCOL]:=http}=%>
DOMAIN = <%=${SoftwareConfigs[DOMAIN]:=localhost}=%>
HTTP_ADDR = <%=${SoftwareConfigs[HTTP_ADDR]:=0.0.0.0}=%>
HTTP_PORT = <%=${SoftwareConfigs[HTTP_PORT]:=3000}=%>
ROOT_URL = <%=${SoftwareConfigs[ROOT_URL]:=%(PROTOCOL)s://%(DOMAIN)s:%(HTTP_PORT)s/}=%>
APP_DATA_PATH = <%=${SoftwarePathData}=%>/data
DISABLE_SSH =  <%=${SoftwareConfigs[DISABLE_SSH]:=false}=%>
START_SSH_SERVER = <%=${SoftwareConfigs[START_SSH_SERVER]:=false}=%>
SSH_PORT = <%=${SoftwareConfigs[SSH_PORT]:=22}=%>
SSH_LISTEN_HOST = <%=${SoftwareConfigs[SSH_LISTEN_HOST]:=0.0.0.0}=%>
SSH_LISTEN_PORT = <%=${SoftwareConfigs[SSH_LISTEN_PORT]:=%(SSH_PORT)s}=%>
SSH_ROOT_PATH = <%=${SoftwareConfigs[SSH_ROOT_PATH]}=%>
OFFLINE_MODE = <%=${SoftwareConfigs[OFFLINE_MODE]:=false}=%>
STATIC_ROOT_PATH =<%=${SoftwareConfigs[STATIC_ROOT_PATH]}=%>

[mailer]
ENABLED = false

[service]
REGISTER_EMAIL_CONFIRM = <%=${SoftwareConfigs[REGISTER_EMAIL_CONFIRM]:=false}=%>
ENABLE_NOTIFY_MAIL = <%=${SoftwareConfigs[ENABLE_NOTIFY_MAIL]:=false}=%>
DISABLE_REGISTRATION = <%=${SoftwareConfigs[DISABLE_REGISTRATION]:=false}=%>
ENABLE_CAPTCHA = <%=${SoftwareConfigs[ENABLE_CAPTCHA]:=false}=%>
REQUIRE_SIGNIN_VIEW = <%=${SoftwareConfigs[REQUIRE_SIGNIN_VIEW]:=false}=%>
ENABLE_CAPTCHA = <%=${SoftwareConfigs[ENABLE_CAPTCHA]:=true}=%>

[picture]
DISABLE_GRAVATAR = <%=${SoftwareConfigs[DISABLE_GRAVATAR]:=true}=%>
ENABLE_FEDERATED_AVATAR = <%=${SoftwareConfigs[ENABLE_FEDERATED_AVATAR]:=false}=%>
AVATAR_UPLOAD_PATH = <%=${SoftwarePathData}=%>/data/avatars
REPOSITORY_AVATAR_UPLOAD_PATH = <%=${SoftwarePathData}=%>/data/repo-avatars

[attachment]
PATH = <%=${SoftwarePathData}=%>/data/attachments

[session]
PROVIDER = file
PROVIDER_CONFIG = <%=${SoftwarePathData}=%>/sessions

[log]
MODE = file
LEVEL = Info
ROOT_PATH = <%=${SoftwarePathData}=%>/log

[security]
INSTALL_LOCK = <%=${SoftwareConfigs[INSTALL_LOCK]:=false}=%>
SECRET_KEY = <%=${SoftwareConfigs[INSTALL_LOCK]:=$(date +%s%N | md5sum | head -c 15)}=%>
