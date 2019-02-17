#!/bin/bash

###############
# Name: FileBrowser Init
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Init.sh
### 创建分享目录
mkdir -p ${SoftwarePathData}/${SoftwareConfigs[root]}
### 执行软件初始化
InitSoftware_default
