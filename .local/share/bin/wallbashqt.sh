#!/usr/bin/env sh


# set variables

scrDir=`dirname "$(realpath "$0")"`
source $scrDir/globalcontrol.sh


# sync qt5 and qt6 colors

cp "${confDir}/qt5ct/colors.conf" "${confDir}/qt6ct/colors.conf"
