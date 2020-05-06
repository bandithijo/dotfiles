#!/usr/local/bin/bash

# Copyright (c) 2020 Rizqi Nur Assyaufi (bandithijo@gmail.com)
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

mem_phys=$(sysctl -n hw.physmem)
mem_hw=$mem_phys
pagesize=$(sysctl -n hw.pagesize)

mem_inactive=$(( $(sysctl -n vm.stats.vm.v_inactive_count) * $pagesize))
mem_cache=$(( $(sysctl -n vm.stats.vm.v_cache_count) * $pagesize))
mem_free=$(( $(sysctl -n vm.stats.vm.v_free_count) * $pagesize))

mem_total=$mem_hw
mem_avail=$(( $mem_inactive + $mem_cache + $mem_free ))
mem_used=$(( $mem_total - $mem_avail ))
mem_usage=$(( $mem_used * 100 / $mem_total ))

echo $mem_usage
