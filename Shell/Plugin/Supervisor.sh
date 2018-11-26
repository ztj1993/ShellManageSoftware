#!/bin/bash

###############
# Name: Software supervisor common function
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 备份配置文件
function BackupSoftwareConfigFile_supervisor() {
    sudo mkdir -p ${ProjectPathBackup}/Supervisor
    OriginalPath=${ConfigFileSupervisor}
    TargetPath=${ProjectPathBackup}/Supervisor
    PathAlias=Supervisor.${AliasSoftware}.${AliasConfig}
    source ${ProjectPathShell}/Common/PathBackup.sh
}

### 生成软件配置文件
function MakeSoftwareConfigFile_supervisor() {
    ### 定义模板路径
    TplFile=$(getFirstExistPath ${TplFileSupervisorCustom} ${TplFileSupervisorDefault})
    if [ ! -f ${TplFile} ]; then
        echo ">>>>> Error: the <TplFile: ${TplFile}> does not exist"
        exit 1
    fi
    ### 生成文件
    TplContent=$(cat ${TplFile})
    TplOutFile=${ConfigFileSupervisor}
    source ${ProjectPathShell}/Common/TplEngine.sh
}

### 默认 Supervisor 流程
function SupervisorSoftware_default(){
    # 判断服务是否启用
    sudo supervisorctl status > /dev/null 2>&1
    [ $? -ne 0 ] && echo ">>>>> Warning: supervisord is not available" && return 1
    # 备份配置文件
    [ -f ${ConfigFileSupervisor} ] && BackupSoftwareConfigFile_supervisor
    # 生成配置文件
    MakeSoftwareConfigFile_supervisor
    # 创建日志目录
    sudo mkdir -p /var/log/supervisor
    # 重新加载 Supervisor
    sudo supervisorctl reload
}
