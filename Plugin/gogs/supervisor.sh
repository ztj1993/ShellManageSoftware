#!/bin/bash

###############
# Name: Gogs Supervisor
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Supervisor.sh
### 执行 Supervisor 配置生成
SupervisorSoftware_default
