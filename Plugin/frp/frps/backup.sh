#!/bin/bash

###############
# Name: Frps Backup
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 定义批量复制路径
BatchCopyPaths=(
    "${SoftwarePathData}/*=>${SoftwarePathBackup}"
    "${SoftwareConfigFile}=>${SoftwarePathBackup}/custom.frps.ini"
)

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Backup.sh
### 执行备份
BackupSoftware_default
