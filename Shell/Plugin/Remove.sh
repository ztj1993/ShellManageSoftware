#!/bin/bash

###############
# Name: Software remove common function
# author: ZhangTianJie
# email: ztj1993@gmail.com
###############

function Remove_bin(){
    rm -rf ${SoftwarePathInstall}
}

function Remove_package(){
    rm -rf ${SoftwarePathPackage}
}

function Remove_data(){
    rm -rf ${SoftwarePathData}
}

function Remove_systemd(){
    rm -rf ${ConfigFileSystemd}
}

function Remove_supervisor(){
    rm -rf ${ConfigFileSupervisor}
}
