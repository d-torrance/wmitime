# Copyright (C) 2005-2007 Jari Aalto
#
# This program is free software; you can redistribute it and or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details at
# <http://www.gnu.org/copyleft/gpl.html>
#
# Put this to 'install' target:
#
#   install: build $(MANPAGE)

PACKAGE		= package
PODCENTER	= $$(date "+%Y-%m-%d")
MANSECT		= 1
MANDEST		= $(MANSRC)

MANPOD		= $(MANSRC)$(PACKAGE).$(MANSECT).pod
MANPAGE		= $(MANDEST)$(PACKAGE).$(MANSECT)

makeman: $(MANPAGE)

$(MANPAGE): $(MANPOD)
	pod2man --center="$(PODCENTER)" \
		--name="$(PACKAGE)" \
		--section="$(MANSECT)" \
		$(MANPOD) \
	| sed 's,[Pp]erl v[0-9.]\+,$(PACKAGE),' \
	> $(MANPAGE) && \
	rm -f pod*.tmp

# End of of Makefile part
