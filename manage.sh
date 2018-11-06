#!/bin/bash

###############
# Name: 软件管理脚本
# Params 1: <AliasSoftware> 软件别名
# Params 2: <AliasCommand> 软件命令
# Params 3: <AliasConfig> 配置别名
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 定义帮助文本
if [ "${1}" == "help" ] || [ "${1}" == "" ]; then
    echo ">>> params 1 <AliasSoftware>"
    echo ">>> params 2 <AliasCommand>[install|init|backup|supervisor|systemd]"
    echo ">>> params 3 <AliasConfig>"
    exit
fi

### 环境定义
ProjectPathRoot=$(cd $(dirname $(readlink -f ${BASH_SOURCE[0]})) && pwd)
ProjectPathBackup=${ProjectPathRoot}/Backup
ProjectPathBin=${ProjectPathRoot}/Bin
ProjectPathCustom=${ProjectPathRoot}/Custom
ProjectPathPackage=${ProjectPathRoot}/Package
ProjectPathPlugin=${ProjectPathRoot}/Plugin
ProjectPathShell=${ProjectPathRoot}/Shell

### 引入通用脚本
source ${ProjectPathShell}/Common/Function.sh

### 定义别名变量
AliasSoftware=${1}
AliasCommand=${2}
AliasConfig=${3:-default}
AliasSoftwareMain=$(getStringArrayItem "${1}" "." "0")
AliasSoftwareSub=$(getStringArrayItem "${1}" "." "1")

### 引入管理脚本
source ${ProjectPathShell}/Manage/Variables.sh
source ${ProjectPathShell}/Manage/ExecFlow.sh
