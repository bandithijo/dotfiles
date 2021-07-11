# Joseph Tannhuber <sepp.tannhuber@yahoo.de>, 2013
# Solarized like colorscheme, similar to solarized-dircolors
# from https://github.com/seebi/dircolors-solarized.
# This is a modification of Roman Zimbelmann's default colorscheme.
# This software is distributed under the terms of the GNU GPL version 3.

from __future__ import (absolute_import, division, print_function)

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    blue, cyan, green, magenta, red, white, yellow, default,
    normal, bold, reverse, black,
    default_colors,
)


class Codedark(ColorScheme):
    progress_bar_color = 24

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg = default
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = 0
                bg = red
                attr = normal
            if context.border:  # jadi satu dengan r
                fg = 14
            if context.media:
                if context.image:
                    fg = 4
                else:
                    fg = 4
            if context.container:
                fg = 3
            if context.directory:
                fg = 3
                attr |= bold
            elif context.executable and not \
                    any((context.media, context.container,
                        context.fifo, context.socket)):
                fg = 2
                attr |= bold
            if context.socket:
                fg = 2
                attr |= bold
            if context.fifo:
                fg = 2
                attr |= bold
            if context.device:
                fg = 3
                attr |= bold
            if context.link:
                fg = context.good and 6 or 6
                bg = context.bad and default
                attr |= normal
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, magenta):
                    fg = white
                else:
                    fg = 1
            if not context.selected and (context.cut or context.copied):
                fg = 1
                attr |= bold
            if context.main_column:
                if context.selected:
                    fg = 24
                    bg = 14
                    attr |= bold
                if context.marked:
                    attr |= bold
                    bg = 14
                    fg = 24
            if context.badinfo:
                if attr & reverse:
                    bg = 3
                else:
                    fg = 3

        elif context.in_titlebar:
            fg = 9
            attr |= bold
            if context.hostname:
                fg = 14
                bg = 0
            elif context.directory:
                fg = 3
            elif context.tab:
                fg = 9 if context.good else default
                bg = default
            elif context.link:
                fg = 6

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 2
                    attr |= bold
                elif context.bad:
                    fg = 9
                    attr |= bold
            if context.marked:
                attr |= bold | reverse
                fg = 9
            if context.frozen:
                attr |= bold | reverse
                fg = 4
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = black
                    bg = red
            if context.loaded:
                fg = 7
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = yellow
                attr &= ~bold
            if context.vcscommit:
                fg = yellow
                attr &= ~bold
            if context.vcsdate:
                fg = yellow
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 93

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    fg = 7
                    bg = self.progress_bar_color

# tambahan -------------------------------------------------------------------

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = magenta
            elif context.vcsuntracked:
                fg = cyan
            elif context.vcschanged:
                fg = red
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = green
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = green
            elif context.vcsbehind:
                fg = red
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = magenta
            elif context.vcsunknown:
                fg = red

        return fg, bg, attr
