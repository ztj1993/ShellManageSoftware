#!/bin/bash

###############
# Name: Gogs Install
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Install.sh
### 判断软件是否已经安装
IsInstalld_file gogs
### 判断软件是否具备安装条件
IsInstallEnv_type wget git
### 下载软件
DowmPackage_wget
### 解压软件
UnPackage_tar
### 验证软件安装
CheckInstalld_file gogs
