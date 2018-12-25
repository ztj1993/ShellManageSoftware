#!/bin/bash

###############
# Name: 简单模板引擎
# Author: ZhangTianJie
# Email: ztj1993@gmail.com
# Params: <TplContent>[TplString|FilePath|Required]
# Params: <OutFile>[FilePath]
# Return=0: success
# Return=1: failure
# Output: result content OR error message
###############

### 定义帮助文本
if [ "${1}" == "help" ]; then
    echo ">>> Params: <TplContent>[TplString|FilePath|Required]"
    echo ">>> Params: <OutFile>[FilePath]"
    echo ">>> Return=0: success"
    echo ">>> Return=1: failure"
    echo ">>> Output: result content OR error message"
    exit 0
fi

### 设置变量
[ -z "${TplContent}" ] && TplContent="${1}"
[ -z "${TplOutFile}" ] && TplOutFile="${2}"
[ -z "${TplVars}" ] && TplVars=("${@:3}")

### 设置模板变量
if [ "${TplVars[*]}" != "" ]; then
    for VarString in ${TplVars[@]}
    do
        eval ${VarString}
    done
fi

### 判断是否设置了模板内容变量
[ -f "${TplContent}" ] && TplContent=$(cat ${TplContent})
[ "${TplContent}" == "" ] && echo ">>>>> Error: the var <TplContent> does not exist" && exit 1

### 替换所有的 $ 为 \$
TplContent=${TplContent//\$/\\\$}

### 将所有的变量和语句中的 \$ 替换 $
TplContent=$(echo "${TplContent}" | sed -E '/<[%|{]=.+?=[%|}]>/ s/\\\$/$/g')

### 替换所有的非语句中的 " 为 \"
TplContent=$(echo "${TplContent}" | sed -e '/^<{=/! s/\"/\\\"/g')

### 将所有的非语句 echo 一下
TplContent=$(echo "${TplContent}" | sed -e '/^<{=/! s/^.*$/echo "&"/')

### 替换掉所有的模板标签
TplContent=$(echo "${TplContent}" | sed -e 's/<{=\|=}>\|<%=\|=%>//g')

### 执行字符串
TplContent=$(eval "${TplContent}")

[ "${TplOutFile}" != "" ] && echo "${TplContent}" | tee ${TplOutFile}
