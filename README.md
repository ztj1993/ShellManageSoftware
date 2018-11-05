Shell 软件管理工具
======

这是一套 Linux 软件管理工具，使用 Shell 开发，项目轻量简单，支持插件扩展。

### 项目优点
- 开源化：所有代码均在 Github，欢迎加入我们
- 多平台：支持 linux_amd64, linux_386, linux_arm64 平台
- 多环境：支持 ubuntu, centos 等 linux 环境
- 易部署：项目开箱即用，亦可自定义配置
- 易开发：所有代码均采用 Shell 脚本开发
- 插件化：可以通过插件任意扩展
- 多部署：可以实现单软件多开，多部署

### 主要功能
- 项目功能
  - 一键安装，可以快速安装软件，免去了解软件安装过程
  - 一键配置，可以通过默认的或预先设定的配置文件，快速配置软件
  - 一键备份，可以生成软件备份，防止数据丢失
  - 多服务管理，可以通过 Systemd & Supervisor 管理自己的服务
  - 多软件管理，可以通过插件扩展项目，增加您想要软件
  - 多部署管理，可以通过不同的配置文件，实现单软件多个服务部署
- 项目插件
  - 代码托管：gogs
  - 文档服务：mindoc
  - 代理，内网穿透：frp

### 项目地址
- Github(国外)：https://github.com/ztj1993/ShellManageSoftware.git
- Gitee(国内)：https://gitee.com/zhangtianjie/ShellManageSoftware.git

### 安装部署
```bash
git clone https://github.com/ztj1993/ShellManageSoftware.git
cd ShellManageSoftware
git submodule update --init --recursive
chmod +x manage.sh
```

### 软件使用示例
具体请参考：[使用文档](Docs/使用文档.md)

Gogs 部署示例
```bash
# 安装 (环境处理，下载，解压，安装 等操作)
./manage.sh gogs install
# 初始化 (生成软件配置，处理软件运行环境)
./manage.sh gogs init
# 创建服务 (生成服务配置文件)
./manage.sh gogs systemd
# 启动服务
sudo systemctl start gogs.default.service
# 查看服务状态
sudo systemctl status gogs.default.service
```

Frp Server 部署示例
```bash
# 安装
./manage.sh frp install
# 初始化 (注意这里只初始化了 frps)
./manage.sh frp.frps init
# 创建服务 (生成服务配置文件)
./manage.sh frp.frps systemd
# 启动服务
sudo systemctl start frp.frps.default.service
# 查看服务状态
sudo systemctl status frp.frps.default.service
```

### 注意事项
- 现阶段只支持 linux_amd64 平台
- 线上环境推荐使用 Systemd 服务
- 请根据环境选择 Supervisor 服务
  - 开发环境建议使用 Supervisor 服务并启用 Web UI 管理界面
  - Windows for ubuntu 不支持 systemd
  - Chroot for ubuntu 不支持 systemd
- 线上环境注意修改某些会话 Key, 密钥 (切记)
- 单软件多部署时，注意采用不同的端口，不同的会话 Key, 密钥 (切记)
- 请注意软件所在的上级目录权限，要求权限为：755 (请注意用户主目录权限为 700)

### 主要名词解释
- 项目(Project)：指本项目
- 插件(Plugin)：指项目插件
- 软件(Software)：指插件中的第三方软件
- 更多请查看 [相关词解释](Docs/名词释义.md)

### 文档索引
- 使用相关
  - [使用文档](Docs/使用文档.md)
  - [自定义配置](Docs/自定义配置.md)
  - [发布日志](Docs/发布日志.md)
  - [常见问题](Docs/常见问题.md)
- 开发相关
  - [相关词解释](Docs/名词释义.md)
  - [文件说明](Docs/文件说明.md)
  - [插件开发](Docs/插件开发.md)
  - [方案设计](Docs/方案设计/README.md)

### todo
- 插件管理
- 软件更新，卸载，还原
- 软件多版本安装及管理

### 开发计划
- 具体的开发点可以关注 [这里](https://github.com/ztj1993/ShellManageSoftware/projects)
- 开发阶段 (0.x.x)
  - 0.1.x
    - 实现基本框架
    - 线上环境测试
  - 0.2.x
    - 完善对平台支持
    - 完善插件
    - 完善文档
  - 0.3.x
    - 完善部署方式
    - 实现简单测试
    - 实现项目配置文件化

### 为 ShellManageSoftware 做贡献
本项目是一个开源项目，欢迎任何人为其开发和进步贡献力量。
- 在使用过程中出现任何问题，请通过 [Issue](https://github.com/ztj1993/ShellManageSoftware/issues) 反馈
- Bug 修复可以直接提交 Pull Request 到 develop 分支
- 如果您有任何其他方面的问题，欢迎邮件至 ztj1993@gmail.com 交流
