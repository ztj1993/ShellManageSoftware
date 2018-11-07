#!/bin/bash

###############
# Name: 批量路径复制脚本
# Author: ZhangTianJie
# Email: ztj1993@gmail.com
# Params: <BatchCopyPaths>[ArrayString](SrcPath=>DistPath)
# Return=0: success
# Return=!0: failure, failed index
###############

### 定义帮助文本
if [ "${1}" == "help" ]; then
    echo ">>> Params: <BatchCopyPaths>[ArrayString](SrcPath=>DistPath)"
    echo ">>> Return=0: success"
    echo ">>> Return=!0: failure, failed index"
    exit 0
fi

### 设置变量
[ -z "${BatchCopyPaths}" ] && BatchCopyPaths=(${*})

### 判断是否定义了路径
if [ "${BatchCopyPaths[*]}" == "" ]; then
    echo ">>>>> Error: the var <BatchCopyPaths> does not exist"
    exit 1
fi

### 循环数组
for i in ${!BatchCopyPaths[@]}
do
    Path=${BatchCopyPaths[$i]}
    SrcPath=${Path%=>*}
    DistPath=${Path#*=>}
    ### 跳过不存在路径
    if [ "${SkipNotExist}" == "yes" ]; then
        if [ ! -e ${SrcPath%\*} ]; then
            continue
        fi
        if [ ! -e ${DistPath} ]; then
            continue
        fi
    fi
    ### 复制文件
    sudo sh -c "cp -pr ${Path%=>*} ${Path#*=>}"
    if [ $? -ne 0 ]; then
        echo ">>>>> Error: copy <${Path}> error"
        exit $(($i+1))
    fi
done
