#!/bin/bash

###############
# Name: Software before
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 获取软件支持平台
getSoftwarePlatform

### 处理软件路径
SoftwareUrl=$(handleSoftwarePath ${SoftwareUrl})
SoftwarePathPackage=$(handleSoftwarePath ${SoftwarePathPackage})
