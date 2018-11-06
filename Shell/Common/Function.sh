#!/bin/bash

###############
# Name: 获取第一个存在的路径
# Params: <Path Path...> 路径
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############
function getFirstExistPath () {
    for Path in ${*}
    do
        [ -e "${Path}" ] && echo "${Path}" && return 0
    done
    return 1
}

###############
# Name: 获取字符串数组元素
# Params 1: <String> 字符串
# Params 2: <Delimiter> 定界符
# Params 3: <Index> 索引
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############
function getStringArrayItem () {
    Str=${1}
    Delimiter=${2}
    Index=${3}
    Arr=(${Str//$Delimiter/ })
    echo ${Arr[$Index]}
}

###############
# Name: 获取平台类型
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############
function getPlatformType () {
    # ARM 处理器
    if uname -m | grep -Eqi "armv7"; then
        echo "arm armv7"
        return 0
    elif uname -m | grep -Eqi "armv8"; then
        echo "arm64 armv8"
        return 0
    fi
    # 是否 64 位系统
    if [ $(getconf WORD_BIT) == "32" ] && [ $(getconf LONG_BIT) == "64" ]; then
        is_64bit=y
    else
        is_64bit=n
    fi
    # 是否为 ARM
    if uname -m | grep -Eqi "arm|aarch64"; then
        is_arm=y
    fi
    # 开始组装合适的返回码
    if [ "${is_arm}" == "y" ]; then
        if [ "${is_64bit}" == "y" ]; then
            echo "arm64"
        else
            echo "arm"
        fi
    else
        if [ "${is_64bit}" == "y" ]; then
            echo "amd64 x64 x86_64 x86-64"
        else
            echo "386 x86 i386"
        fi
    fi
}
