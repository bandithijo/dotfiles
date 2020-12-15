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


class Solarized(ColorScheme):
    progress_bar_color = yellow

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            # fg = 244
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
                # fg = 0
                fg = yellow
            if context.media:
                if context.image:
                    # fg = 136
                    fg = blue
                else:
                    fg = 9
            if context.container:
                fg = green
            if context.directory:
                fg = yellow
            elif context.executable and not \
                    any((context.media, context.container,
                        context.fifo, context.socket)):
                fg = red
                attr |= bold
            if context.socket:
                fg = red
                attr |= bold
            if context.fifo:
                fg = red
                attr |= bold
            if context.device:
                fg = yellow
                attr |= bold
            if context.link:
                fg = context.good and blue or blue
                # bg = context.bad and 235
                bg = context.bad and default
                attr |= normal
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (red, magenta):
                    fg = white
                else:
                    fg = red
            if not context.selected and (context.cut or context.copied):
                # fg = 234
                fg = red
                attr |= bold
            if context.main_column:
                if context.selected:
                    fg = red
                    bg = 0
                    attr |= bold
                if context.marked:
                    attr |= bold
                    # bg = 237
                    bg = yellow
                    fg = 0
            if context.badinfo:
                if attr & reverse:
                    bg = yellow
                else:
                    fg = yellow

        elif context.in_titlebar:
            # attr |= bold
            if context.hostname:
                # fg = context.bad and 160 or 93
                fg = yellow
                # bg = context.bad and 235
                bg = 0
            elif context.directory:
                fg = red
            elif context.tab:
                # fg = 33 if context.good else default
                fg = yellow if context.good else default
                bg = default
            elif context.link:
                fg = 33

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = yellow
                elif context.bad:
                    fg = red
            if context.marked:
                attr |= bold | reverse
                # fg = 237
                fg = yellow
            if context.frozen:
                attr |= bold | reverse
                fg = blue
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = black
                    bg = red
            if context.loaded:
                fg = 0
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
                    fg = 0
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
