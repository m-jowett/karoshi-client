nobase_pkglib_SCRIPTS = common session-tools \
  pam/offline-homes pam/post-session pam/pre-session pam/virtualbox-mkdir pam/wrapper \
  post-session/00core post-session/02configuration_pre post-session/05offline post-session/50configuration \
  pre-session/00core pre-session/05offline pre-session/50configuration \
  services/idle-shutdown services/multicast-listener services/update \
  update/00core update/01offline update/05shutdown

CLEANFILES = $(nobase_pkglib_SCRIPTS)
EXTRA_DIST = common.in session-tools.in \
  pam/offline-homes.in pam/post-session.in pam/pre-session.in pam/virtualbox-mkdir.in pam/wrapper.in \
  post-session/00core.in post-session/02configuration_pre.in post-session/05offline.in post-session/50configuration.in \
  pre-session/00core.in pre-session/05offline.in pre-session/50configuration.in \
  services/idle-shutdown.in services/multicast-listener.in services/update.in \
  update/00core.in update/01offline.in update/05shutdown.in

include $(top_srcdir)/subst.mk
