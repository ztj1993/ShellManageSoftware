#!/bin/bash

###############
# Name: 执行流程
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 开始执行消息
echo ">>>>> Message: start exec ${AliasSoftware}.${AliasConfig}.${AliasCommand}"

### 判断脚本路径
if [ ! -f ${ScriptConfigFileCustom} ] && [ "${AliasConfig}" != "default" ]; then
    echo ">>>>> Error: the <ScriptConfigFileCustom: ${ScriptConfigFileCustom}> does not exist"
    exit 1
fi

### 校验自定义配置文件
if [ ! -f ${ScriptFile} ]; then
    echo ">>>>> Error: the <ScriptFile: ${ScriptFile}> does not exist"
    exit 1
fi

### 引入配置文件
[ -f ${ScriptConfigFileDefault} ] && source ${ScriptConfigFileDefault}
[ -f ${ScriptConfigFileSubDefault} ] && [ -n ${AliasSoftwareSub} ] && source ${ScriptConfigFileSubDefault}
[ -f ${ScriptConfigFileCustom} ] && source ${ScriptConfigFileCustom}

### 引入插件公用脚本
source ${ProjectPathShell}/Plugin/Common.sh
source ${ProjectPathShell}/Plugin/Before.sh

### 引入前置脚本
ScriptBefore=$(getFirstExistPath ${ScriptBeforeCustom} ${ScriptBeforePlugin})
[ -f ${ScriptBefore} ] && source ${ScriptBefore}

### 引入执行脚本
source ${ScriptFile}

### 结束执行消息
if [ $? -ne 0 ]; then
    echo ">>>>> Error: end exec ${AliasSoftware}.${AliasConfig}.${AliasCommand}"
    exit 1
else
    echo ">>>>> Message: end exec ${AliasSoftware}.${AliasConfig}.${AliasCommand}"
fi
