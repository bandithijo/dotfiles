#!/usr/bin/env ruby

# Inspired from lolban owned by BudRich (budlabs YouTube Channel)

kalimat = ARGV.inspect
kalimat.tr!('[,]', '')

if kalimat == ''
  puts '''
FUNBAN!
Inspired from lolban owned by BudRich.
Usage:
  $ funban kata1 kata2 kata3
  kata1
  kata2
  kata3

  $ funban \'kata1 kata2\' kata3
  kata1 kata2
  kata3
  '''
else
  system """
  figlet -d /usr/share/figlet -f 3d -t \"$(printf '%s\n' #{kalimat})\"
  """
end
