#!/bin/bash

###############
# Name: MinDoc Init
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Init.sh
### 执行软件初始化
InitSoftware_default
### 初始化数据库
command="${SoftwarePathInstall}/mindoc_linux_amd64 install -config=${SoftwareConfigFile}"
su - ${SoftwareUserName} -c "${command}"
