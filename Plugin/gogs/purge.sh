#!/bin/bash

###############
# Name: Gogs Purge
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Remove.sh
### 执行净化
Remove_bin
Remove_package
Remove_data
Remove_systemd
Remove_supervisor
