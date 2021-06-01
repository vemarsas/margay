#!/bin/bash
if [[ $(whoami) == root ]]; then
clear
echo -e "\033[1;32m
##########################################################################################
#
#    Copyright (C) 2021 vemar s.a.s
#    (<http://www.vemarsas.it>)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published
#    by the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
###########################################################################################
#
# GENERAL INFO
#
# Provider:                     Vemar s.a.s.
# Required-Start:               June 2021
# Required-Stop:                TBD
# Short-Description:            MARGAY INSTALLATION TOOL
# Description:                  Bash tool to install margay ant its option functionalities
#
# Author:                       Marco Piscopia <marco.piscopia@vemarsas.it>
#
###########################################################################################
#
#                      WELCOME TO MARGAY INSTALLATION TOOL
#
# Select one or more between following options
#
# 0) Default = core and openvpn functionality
# 1) Hotspot/RADIUS functionality
# 2) Virtualization functionality
# 3) Wireless Access Point functionality
#
# Eg.Usage:     #Options: 0 2 3
#
############################################################################################
"
##############################################################################################################################################
# COMMANDS TO BE USED
# 0)Default = core and openvpn functionality    bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup)"
# 1)Hotspot/RADIUS functionality                bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-hotspot)"
# 2)Virtualization functionality                bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-virt)"
# 3)Wireless Access Point functionality         bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-ap)"
# *)No other option
###############################################################################################################################################

echo -ne "\033[1;37mOptions: "
read opt1 opt2 opt3 opt4
opt=($opt1 $opt2 $opt3 $opt4)

for op in "${opt[@]}";
   do
    case "$op" in
    0) if id -u onboard 1> /dev/null; then
          echo " Margay is already installed. Skip this process."
       else
          echo " Installing core and openvpn functionality"
          bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup)" | sudo tee -a /var/log/mgyinstall.log
       fi
       ;;
    1) if id -u onboard 1> /dev/null; then
          echo " Installing Hotspot/RADIUS functionality"
          bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-hotspot)" | sudo tee -a /var/log/mgyinstall.log
       else
          echo " Margay is not installed. Please install default first"
       fi
       ;;
    2) if id -u onboard 1> /dev/null; then
          echo " Installing Virtualization functionality"
          bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-virt)" | sudo tee -a /var/log/mgyinstall.log
       else
          echo " Margay is not installed. Please install default first"
       fi
       ;;
    3) if id -u onboard 1> /dev/null; then
          echo " Installing Wireless Access Point functionality"
          bash -c "$(wget -O - https://raw.githubusercontent.com/vemarsas/margay/master/setup-ap)" | sudo tee -a /var/log/mgyinstall.log
       else
          echo " Margay is not installed. Please install default first"
       fi
       ;;
    *) echo " Option not provided"
         ;;
    esac
   done
else
   echo "Please run this tool as root !"
fi
  

