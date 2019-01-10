#!/bin/bash

###############
# Name: Gitea Install
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 引入通用脚本
source ${ProjectPathShell}/Plugin/Install.sh
### 判断软件是否已经安装
IsInstalld_file gitea
### 判断软件是否具备安装条件
IsInstallEnv_type wget git
### 下载软件
DowmPackage_wget
### 复制软件
Package_copy gitea
### 验证软件安装
CheckInstalld_file gitea
