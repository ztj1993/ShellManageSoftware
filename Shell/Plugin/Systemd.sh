#!/bin/bash

###############
# Name: Software systemd common function
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 备份配置文件
function BackupSoftwareConfigFile_systemd() {
    mkdir -p ${ProjectPathBackup}/Systemd
    OriginalPath=${ConfigFileSystemd}
    TargetPath=${ProjectPathBackup}/Systemd
    PathAlias=Systemd.${AliasSoftware}.${AliasConfig}
    source ${ProjectPathShell}/Common/PathBackup.sh
}

### 生成软件配置文件
function MakeSoftwareConfigFile_systemd() {
    ### 定义模板路径
    TplFile=$(getFirstExistPath ${TplFileSystemdCustom} ${TplFileSystemdDefault})
    if [ ! -f ${TplFile} ]; then
        echo ">>>>> Error: the <TplFile: ${TplFile}> does not exist"
        exit 1
    fi
    ### 生成文件
    TplContent=$(cat ${TplFile})
    TplOutFile=${ConfigFileSystemd}
    source ${ProjectPathShell}/Common/TplEngine.sh
}

### 默认 Systemd 流程
function SystemdSoftware_default(){
    # 判断服务是否启用
    systemctl status > /dev/null 2>&1
    [ $? -ne 0 ] && echo ">>>>> Warning: systemd is not available" && return 1
    # 备份配置文件
    [ -f ${ConfigFileSystemd} ] && BackupSoftwareConfigFile_systemd
    # 生成配置文件
    MakeSoftwareConfigFile_systemd
    # 重新加载 systemd
    systemctl daemon-reload
}
