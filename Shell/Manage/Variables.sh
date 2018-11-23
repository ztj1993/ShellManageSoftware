#!/bin/bash

###############
# Name: 变量定义
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

### 定义系统相关
SysPlatformType=($(getPlatformType))
SysOsType=$(cat /etc/os-release | grep "^ID=" | cut -d "=" -f 2)
SysDateTime=`date +%Y-%m-%d-%H-%M-%S`

### 定义路径相关
PathAliasSoftware=${AliasSoftware/./\/}

### 定义执行脚本相关
ScriptFile=${ProjectPathPlugin}/${PathAliasSoftware}/${AliasCommand}.sh
ScriptConfigFileDefault=${ProjectPathPlugin}/${AliasSoftwareMain}/default.conf
ScriptConfigFileSubDefault=${ProjectPathPlugin}/${PathAliasSoftware}/default.conf
ScriptConfigFileCustom=${ProjectPathCustom}/${AliasSoftware}.${AliasConfig}.conf
ScriptBeforePlugin=${ProjectPathShell}/${AliasSoftwareMain}/Before.sh
ScriptBeforeCustom=${ProjectPathShell}/${AliasSoftware}.${AliasConfig}.Before.sh

### 定义配置相关
ConfigFileSupervisor=/etc/supervisor/conf.d/${AliasSoftware}.${AliasConfig}.conf
ConfigFileSystemd=/etc/systemd/system/${AliasSoftware}.${AliasConfig}.service

### 定义模板相关
TplFileInitDefault=${ProjectPathRoot}/Plugin/${PathAliasSoftware}/init.tpl
TplFileInitCustom=${ProjectPathRoot}/Custom/${AliasSoftware}.${AliasConfig}.init.tpl
TplFileInitExtend=${ProjectPathRoot}/Custom/${AliasSoftware}.${AliasConfig}.init.extend
TplFileSupervisorDefault=${ProjectPathRoot}/Plugin/${PathAliasSoftware}/supervisor.tpl
TplFileSupervisorCustom=${ProjectPathRoot}/Custom/${AliasSoftware}.${AliasConfig}.supervisor.tpl
TplFileSystemdDefault=${ProjectPathRoot}/Plugin/${PathAliasSoftware}/systemd.tpl
TplFileSystemdCustom=${ProjectPathRoot}/Custom/${AliasSoftware}.${AliasConfig}.systemd.tpl

### 定义软件相关
SoftwarePathBackup=${ProjectPathBackup}/${AliasSoftware}.${AliasConfig}.${SysDateTime}
