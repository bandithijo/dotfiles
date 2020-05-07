#!/usr/bin/env bash

# Copyright (C) 2020 Rizqi Nur Assyaufi <bandithijo@gmail.com>
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see http://www.gnu.org/licenses/.

wlan_card='wls3'

wlan_do=$(ifstat2 -i $wlan_card 1 1 | awk 'NR%3==0 {print $1}')
wlan_up=$(ifstat2 -i $wlan_card 1 1 | awk 'NR%3==0 {print $2}')

echo "" $wlan_do "" $wlan_up "KB/s"
