#!/bin/bash

###############
# Name: Software install common function
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 判断软件是否已经安装
function IsInstalld_file() {
    if [ -f ${SoftwarePathInstall}/${1} ]; then
        echo ">>>>> Error: The software has been installed"
        exit 1
    fi
}

### 判断软件是否具备安装条件
function IsInstallEnv_type() {
    for Name in ${*}
    do
        type ${Name} > /dev/null 2>&1
        [ $? -ne 0 ] && echo ">>>>> Error: Please install the ${Name} first" && exit 1
    done
}

### 下载软件包
function DowmPackage_wget() {
    if [ -f ${SoftwarePathPackage} ]; then
        return 0
    fi
    TmpFile=`mktemp /tmp/temp.XXXXXX`
    wget ${SoftwareUrl} -O ${TmpFile}
    if [ $? -ne 0 ]; then
        echo ">>>>> Error: The software download error"
        rm -f ${TmpFile}
        exit 1
    fi
    mv ${TmpFile} ${SoftwarePathPackage}
    if [ $? -ne 0 ]; then
        echo ">>>>> Error: The software move error"
        rm -f ${TmpFile}
        exit 1
    fi
}

### 解压软件
function UnPackage_zip(){
    mkdir -p ${SoftwarePathInstall}
    unzip -q ${SoftwarePathPackage} -d ${SoftwarePathInstall}
    [ $? -ne 0 ] && echo ">>>>> Error: The software unzip error" && exit 1
}
function UnPackage_tar(){
    mkdir -p ${SoftwarePathInstall}
    tar -xf ${SoftwarePathPackage} --strip-components 1 -C ${SoftwarePathInstall}
    [ $? -ne 0 ] && echo ">>>>> Error: The software untar error" && exit 1
}

### 验证软件安装
function CheckInstalld_file() {
    if [ ! -f ${SoftwarePathInstall}/${1} ]; then
        echo ">>>>> Error: The software install fail"
        exit 1
    fi
}

### 配置配置
function ConfigSoftware_install(){
    # 用户组及用户
    sudo groupadd -f ${SoftwareGroup}
    id -u ${SoftwareUser} > /dev/null 2>&1
    [ $? -ne 0 ] && sudo useradd -m -g ${SoftwareGroup} ${SoftwareUser}
    # 用户目录权限
    sudo chown ${SoftwareUser}.${SoftwareGroup} /home/${SoftwareUser}
    # 软件安装目录权限
    sudo chown -R ${SoftwareUser}.${SoftwareGroup} ${SoftwarePathInstall}
}
