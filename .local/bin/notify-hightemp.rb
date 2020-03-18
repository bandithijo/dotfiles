#!/usr/bin/env ruby

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

Process.setproctitle("notify-hightemp")

#require 'open3'

CPU_TEMP_THRESHOLD = 90  # <- Normaly 90-100
NOTIF_DURATION = 2.5     # <- Second
NOTIF_VOLUME = 5         # <- Range 0-10

def notif_volume_converter(value)
  volume_rate = value * 6553.6
end

begin
  while true
    # For GNU/Linux
    #capture_temp = "cat /sys/class/thermal/thermal_zone0/temp"
    #temp = Open3.capture2(capture_temp)
    #temp_cpu = (temp[0].to_i / 1000)
    # For FreeBSD
    capture_temp = `sysctl -n dev.cpu.0.temperature`
    temp_cpu = capture_temp.delete_suffix(".0C\n").to_i
    temp_threshold = CPU_TEMP_THRESHOLD
    notif_duration = (NOTIF_DURATION * 1000).to_i
    notif_volume = notif_volume_converter(NOTIF_VOLUME)

    if temp_cpu >= temp_threshold
      # If using dunst
      #system("notify-send 'High CPU Temperature''!' 'The CPU has been hard at work in the past minute.' --urgency=critical --expire-time=#{notif_duration}")
      # If using xfce4-notify
      system("notify-send 'High CPU Temperature''!' 'The CPU has been hard at work in the past minute.'")
      system("paplay /usr/home/bandithijo/snd/Ringtones/Alert/aircraftalarm.wav --volume=#{notif_volume}")
    end

    sleep(5)
  end
rescue Interrupt
  puts "\nExiting..."
end
