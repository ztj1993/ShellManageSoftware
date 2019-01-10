#!/bin/bash

###############
# Name: Software init common function
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 备份软件配置文件
function BackupSoftwareConfigFile_init() {
    mkdir -p ${ProjectPathBackup}/Init
    OriginalPath=${SoftwareConfigFile}
    TargetPath=${ProjectPathBackup}/Init
    PathAlias=Init.${AliasSoftware}.${AliasConfig}
    source ${ProjectPathShell}/Common/PathBackup.sh
}

### 生成软件配置文件
function MakeSoftwareConfigFile_init() {
    ### 定义模板路径
    TplFile=$(getFirstExistPath ${TplFileInitCustom} ${TplFileInitDefault})
    if [ ! -f ${TplFile} ]; then
        echo ">>>>> Error: the <TplFile: ${TplFile}> does not exist"
        exit 1
    fi
    ### 生成文件
    TplContent=$(cat ${TplFile})
    TplOutFile=${SoftwareConfigFile}
    source ${ProjectPathShell}/Common/TplEngine.sh
    ### 扩展文件处理
    [ -f ${TplFileInitExtend} ] && cat ${TplFileInitExtend} | tee -a ${SoftwareConfigFile}
}

### 创建用户
function CreateUser_init() {
    # 创建用户组
    groupadd -f ${SoftwareUserGroup}
    # 判断用户是否存在
    id -u ${SoftwareUserName} > /dev/null 2>&1
    # 创建用户
    if [ $? -ne 0 ]; then
        mkdir -p ${SoftwareUserHome}
        useradd -g ${SoftwareUserGroup} -d ${SoftwareUserHome} ${SoftwareUserName} > /dev/null 2>&1
        [ $? -ne 0 ] && echo ">>>>> Error: create user <${SoftwareUserName}> failed" && exit 1
    fi
    # 复制用户环境
    if [ ! -f ${SoftwareUserHome}/.bashrc ]; then
        cp -frn /etc/skel/. ${SoftwareUserHome}
    fi
    # 配置权限
    chown -R ${SoftwareUserName}.${SoftwareUserGroup} ${SoftwareUserHome}
    chmod -R 700 ${SoftwareUserHome}
}

### 默认初始化软件流程
function InitSoftware_default(){
    # 创建用户
    CreateUser_init
    # 创建配置文件目录
    mkdir -p $(dirname ${SoftwareConfigFile})
    # 创建数据目录
    mkdir -p ${SoftwarePathData}
    # 备份已经配置过的配置文件
    [ -f ${SoftwareConfigFile} ] && BackupSoftwareConfigFile_init
    # 生成配置文件
    MakeSoftwareConfigFile_init
    # 配置权限
    chown ${SoftwareUserName}.${SoftwareUserGroup} ${SoftwareConfigFile}
    chown -R ${SoftwareUserName}.${SoftwareUserGroup} ${SoftwarePathInstall}
    chown -R ${SoftwareUserName}.${SoftwareUserGroup} ${SoftwarePathData}
    chmod -R 755 ${SoftwarePathInstall}
}
