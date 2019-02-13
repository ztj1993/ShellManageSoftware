#!/bin/bash

###############
# Name: Software before
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 获取软件支持平台
getSoftwarePlatform

### 获取软件用户配置
SoftwareUserConfigFileDefault=${ProjectPathConfig}/user.${SoftwareUserAlias}.conf
SoftwareUserConfigFileCustom=${ProjectPathCustom}/config.user.${SoftwareUserAlias}.conf
SoftwareUserConfigFile=$(getFirstExistPath ${SoftwareUserConfigFileCustom} ${SoftwareUserConfigFileDefault})
if [ ! -f ${SoftwareUserConfigFile} ]; then
    echo ">>>>> Error: the <SoftwareUserConfigFile: ${SoftwareUserConfigFile}> does not exist"
    exit 1
else
    source ${SoftwareUserConfigFile}
fi

### 处理软件路径
SoftwareUrl=$(handleSoftwarePath ${SoftwareUrl})
SoftwarePathPackage=$(handleSoftwarePath ${SoftwarePathPackage})
SoftwareConfigFile=$(handleSoftwarePath ${SoftwareConfigFile})
SoftwarePathInstall=$(handleSoftwarePath ${SoftwarePathInstall})
SoftwarePathData=$(handleSoftwarePath ${SoftwarePathData})
