#
# Makefile for Dynamic DNS Updeter
#

INSTALL_AS=enomdns
DESTDIR=/opt/$(INSTALL_AS)
CONFIG=$(DESTDIR)/config
UPDATE=$(DESTDIR)/update


default:
	@echo "Make what?"
	@false


install:
	id "$(INSTALL_AS)" > /dev/null 2>&1 \
		|| useradd \
			-c "eNOM DNS Updater" \
			-d "$(DESTDIR)" \
			-m \
			"$(INSTALL_AS)"
	cp -f update "$(DESTDIR)"
	[ -e "$(CONFIG)" ] || cp -f config "$(CONFIG)"
	chmod 600 "$(CONFIG)"
	chown -R "$(INSTALL_AS).$(INSTALL_AS)" "$(DESTDIR)"
	sed -e 's|__UPDATE__|$(UPDATE)|g' crontab \
	| crontab -u "$(INSTALL_AS)" -


clean:
	rm -f $(TO_CLEAN) *~
