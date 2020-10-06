#!/usr/bin/env ruby

# Copyright (C) 2019 Rizqi Nur Assyaufi <bandithijo@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

Process.setproctitle("notify-hightemp")

require 'open3'

CPU_TEMP_THRESHOLD = 90  # <- Normaly 90-100
NOTIF_DURATION = 1000    # <- Duration in milisecond
NOTIF_VOLUME = 5         # <- Range between 0-10

def notif_volume_converter(value)
  value * 6553.6
end

begin
  while true
    capture_temp = "cat /sys/class/thermal/thermal_zone0/temp"
    temp = Open3.capture2(capture_temp)
    temp_cpu = (temp[0].to_i / 1000)
    temp_threshold = CPU_TEMP_THRESHOLD
    notif_duration = (NOTIF_DURATION * 1000).to_i
    notif_volume = notif_volume_converter(NOTIF_VOLUME)

    if temp_cpu >= temp_threshold
      system("dunstify '  CPU TEMPERATURE OVERLOAD!' --urgency=critical --timeout=#{notif_duration} -r 1")
      system("paplay $HOME/snd/Ringtones/Alert/aircraftalarm.wav --volume=#{notif_volume}")
      if system("which thinkalert > /dev/null 2>&1") == true  # <- Need to install thinkalert
        system("thinkalert 5")
      end
    end

    sleep(5)
  end
rescue Interrupt
  puts "\nExiting..."
end
