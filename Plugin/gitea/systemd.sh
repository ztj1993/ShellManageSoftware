#!/bin/bash

###############
# Name: Gitea Systemd
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Systemd.sh
### 执行 Systemd 配置生成
SystemdSoftware_default
