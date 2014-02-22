# Makefile fragment for substituting variables into shell scripts
# Usage: include $(top_srcdir)/subst.mk

%: %.in
	sed $< > $@ \
	  -e '/@makefile_in@/d' \
	  -e 's,@prefix@,$(prefix),g' \
	  -e 's,@bindir@,$(bindir),g' \
	  -e 's,@libdir@,$(libdir),g' \
	  -e 's,@pkglibdir@,$(pkglibdir),g' \
	  -e 's,@datadir@,$(datadir),g' \
	  -e 's,@pkgdatadir@,$(pkgdatadir),g' \
	  -e 's,@mandir@,$(mandir),g' \
	  -e 's,@infodir@,$(infodir),g' \
	  -e 's,@docdir@,$(docdir),g' \
	  -e 's,@sysconfdir@,$(sysconfdir),g' \
	  -e 's,@localstatedir@,$(localstatedir),g'
