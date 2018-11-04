APP_NAME = <%=${SoftwareConfigs[APP_NAME]}=%>
RUN_USER = <%=${SoftwareUser}=%>
RUN_MODE = prod

[database]
DB_TYPE = sqlite3
PATH = <%=${SoftwarePathData}=%>/gogs.db

[repository]
ROOT = <%=${SoftwarePathData}=%>/repositories

[server]
DOMAIN = <%=${SoftwareConfigs[DOMAIN]}=%>
HTTP_ADDR = <%=${SoftwareConfigs[HTTP_ADDR]}=%>
HTTP_PORT = <%=${SoftwareConfigs[HTTP_PORT]}=%>
ROOT_URL = <%=${SoftwareConfigs[ROOT_URL]}=%>
APP_DATA_PATH = <%=${SoftwarePathData}=%>/data
DISABLE_SSH = false
SSH_PORT = 22
START_SSH_SERVER = false
OFFLINE_MODE = true

[mailer]
ENABLED = false

[service]
REGISTER_EMAIL_CONFIRM = false
ENABLE_NOTIFY_MAIL = false
DISABLE_REGISTRATION = false
ENABLE_CAPTCHA = false
REQUIRE_SIGNIN_VIEW = false

[picture]
DISABLE_GRAVATAR = true
ENABLE_FEDERATED_AVATAR = false
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
INSTALL_LOCK = true
SECRET_KEY = <%=${SoftwareConfigs[SECRET_KEY]}=%>
