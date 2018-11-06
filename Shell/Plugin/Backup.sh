#!/bin/bash

###############
# Name: Software backup common function
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 默认备份软件流程
function BackupSoftware_default(){
    # 创建备份目录
    sudo mkdir -p ${SoftwarePathBackup}
    # 备份 Supervisor 配置文件
    if [ -f ${ConfigFileSupervisor} ]; then
        BatchCopyPaths=(${BatchCopyPaths[*]} "${ConfigFileSupervisor}=>${SoftwarePathBackup}/supervisor.conf")
    fi
    # 备份 Systemd 配置文件
    if [ -f ${ConfigFileSystemd} ]; then
        BatchCopyPaths=(${BatchCopyPaths[*]} "${ConfigFileSystemd}=>${SoftwarePathBackup}/systemd.conf")
    fi
    # 复制文件
    source ${ProjectPathShell}/Common/BatchCopy.sh
}
