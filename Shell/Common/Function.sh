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
# Name: 获取数组第一个相同的元素
# Params 1: <String> 字符串
# Params 2: <Delimiter> 定界符
# Params 3: <Index> 索引
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############
function getArrayFirstIdentical () {
    Array1=(${1})
    Array2=(${2})

    for Item1 in ${Array1[@]}
    do
        for Item2 in ${Array2[@]}
        do
            if [ ${Item1} == ${Item2} ]; then
                echo ${Item1}
                return 0
            fi
        done
    done

    return 1
}

###############
# Name: 获取平台类型
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############
function getPlatformType () {
    # ARM 处理器
    case $(uname -m) in
        armv5*) echo "armv5 arm" return 0;;
		armv6*) echo "armv6 arm" return 0;;
		armv7*) echo "armv7 arm" return 0;;
		armv8*) echo "armv8 arm64" return 0;;
		aarch64) echo "arm64";;
	esac
    # 是否 64 位系统
    if [ $(getconf WORD_BIT) == "32" ] && [ $(getconf LONG_BIT) == "64" ]; then
        is_64bit=y
    else
        is_64bit=n
    fi
    # 是否为 ARM
    if uname -m | grep -Eqi "arm"; then
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
