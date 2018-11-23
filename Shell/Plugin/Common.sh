#!/bin/bash

###############
# Name: Software common function
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 获取软件支持平台
function getSoftwarePlatform() {
    # 判断平台支持情况
    if [ -n "${SoftwareSupportePlatform}" ]; then
        SoftwarePlatform=$(getArrayFirstIdentical "${SysPlatformType}" "${SoftwareSupportePlatform}")
        if [ -z "${SoftwarePlatform}" ]; then
            echo ">>>>> Error: The software does not support this platform"
            exit 1
        fi
    fi
}

### 处理软件路径
function handleSoftwarePath(){
    # 判断路径的变量系统是否存在
    TmpPath="${1}"
    TmpPath=$(echo "${TmpPath}" | sed -e "s/{Version}/${SoftwareVersion}/g")
    TmpPath=$(echo "${TmpPath}" | sed -e "s/{Platform}/${SoftwarePlatform}/g")
    echo "${TmpPath}"
}
