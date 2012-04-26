
PROJECT      = g-smith
MAKEFILE     = Makefile
PROJECTFILES = $(shell cat ./MANIFEST)
DISTDIR      = $(PROJECT)-$(shell date +'%Y%m%d')


dist: $(PROJECTFILES) $(MAKEFILE)
	@echo ...dist
	@echo
	-rm -rf $(DISTDIR)
	mkdir -p $(DISTDIR)
	for F in $(PROJECTFILES); do \
        mkdir -p $(DISTDIR)/`dirname $$F`; \
        cp -rf $$F $(DISTDIR)/`dirname $$F`; \
    done
	tar -czvf $(DISTDIR).tgz $(DISTDIR)
	rm -rf $(DISTDIR)


clean: $(MAKEFILE)
	@echo ...clean
	@echo


