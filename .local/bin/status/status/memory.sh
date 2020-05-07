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

# FreeBSD
#mem_phys=$(sysctl -n hw.physmem)
#mem_hw=$mem_phys
#pagesize=$(sysctl -n hw.pagesize)
#mem_inactive=$(( $(sysctl -n vm.stats.vm.v_inactive_count) * $pagesize))
#mem_cache=$(( $(sysctl -n vm.stats.vm.v_cache_count) * $pagesize))
#mem_free=$(( $(sysctl -n vm.stats.vm.v_free_count) * $pagesize))
#mem_total=$mem_hw
#mem_avail=$(( $mem_inactive + $mem_cache + $mem_free ))
#mem_used=$(( $mem_total - $mem_avail ))
#mem_usage=$(( $mem_used * 100 / $mem_total ))
#echo $mem_usage

# GNU/Linux
mem_total=$(free | awk 'NR%2==0 {print $2}')
mem_used=$(free | awk 'NR%2==0 {print $3}')
mem_usage=$(( $mem_used * 100 / $mem_total ))
echo " "$mem_usage"%"
