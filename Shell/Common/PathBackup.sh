#!/bin/bash

###############
# Name: 路径备份
# Author: ZhangTianJie
# Email: ztj1993@gmail.com
# Params: <OriginalPath>(FilePath|DirPath|Required)
# Params: <TargetPath|Optional>(DirPath)
# Params: <PathAlias|Optional>(FileName|DirName)
# Return=0: success
# Return=1: failure
# Output: error message
###############

### 定义帮助文本
if [ "${1}" == "help" ]; then
    echo ">>> Params: <OriginalPath>(FilePath|DirPath|Required)"
    echo ">>> Params: <TargetPath|Optional>(DirPath)"
    echo ">>> Params: <PathAlias|Optional>(FileName|DirName)"
    echo ">>> Return=0: success"
    echo ">>> Return=1: failure"
    echo ">>> Output: error message"
    exit
fi

### 设置变量
[ -z "${OriginalPath}" ] && OriginalPath="${1}"
[ -z "${TargetPath}" ] && TargetPath="${2}"
[ -z "${PathAlias}" ] && PathAlias="${3}"

### 处理变量
[ -z "${TargetPath}" ] && TargetPath=$(dirname "${OriginalPath}")
[ -z "${PathAlias}" ] && PathAlias=$(basename "${OriginalPath}")

### 判断变量
if [ ! -f "${OriginalPath}" ] && [ ! -d "${OriginalPath}" ]; then
    echo ">>>>> Error: the var <OriginalPath> does not exist"
    exit 1
fi

### 备份原始文件
if [ ! -f "${TargetPath}/${PathAlias}.bak" ] && [ ! -d "${TargetPath}/${PathAlias}.bak" ]; then
    sudo cp -fR "${OriginalPath}" "${TargetPath}/${PathAlias}.bak"
fi

### 按日期备份
DateTime=`date +%Y-%m-%d-%H-%M-%S`
sudo cp -fR "${OriginalPath}" "${TargetPath}/${PathAlias}.bak.${DateTime}"
[ $? -ne 0 ] && echo ">>>>> Error: backup <${OriginalPath}> error" && exit 1
