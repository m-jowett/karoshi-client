applicationsdir = @applicationsdir@
iconsdir = @iconsdir@

pkgconfdir = $(sysconfdir)/karoshi-client
pkgstatedir = $(localstatedir)/lib/karoshi-client

pkgconf_variablesdir = $(pkgconfdir)/variables

lib_pamdir = $(pkglibexecdir)/pam
lib_updatedir = $(pkglibexecdir)/update
lib_servicesdir = $(pkglibexecdir)/services
lib_pre_sessiondir = $(pkglibexecdir)/pre-session
lib_post_sessiondir = $(pkglibexecdir)/post-session

data_offlinedir = $(pkgdatadir)/offline
data_admin_skeldir = $(pkgdatadir)/admin-skel
data_admin_skel_menusdir = $(data_admin_skeldir)/.config/menus

sudoersdir = @sudoersdir@

xdgdir = @xdgdir@
xdg_menusdir = $(xdgdir)/menus
xdg_autostartdir = $(xdgdir)/autostart

thunderbird_extensiondir = @thunderbird_extensionsdir@

#Substitution rule
subst_rule = -e '/[@]makefile_in[@]/d' \
  -e 's,[@]prefix[@],$(prefix),g' \
  -e 's,[@]bindir[@],$(bindir),g' \
  -e 's,[@]libdir[@],$(libdir),g' \
  -e 's,[@]pkglibdir[@],$(pkglibdir),g' \
  -e 's,[@]pkglibexecdir[@],$(pkglibexecdir),g' \
  -e 's,[@]datadir[@],$(datadir),g' \
  -e 's,[@]pkgdatadir[@],$(pkgdatadir),g' \
  -e 's,[@]mandir[@],$(mandir),g' \
  -e 's,[@]infodir[@],$(infodir),g' \
  -e 's,[@]docdir[@],$(docdir),g' \
  -e 's,[@]sysconfdir[@],$(sysconfdir),g' \
  -e 's,[@]pkgconfdir[@],$(pkgconfdir),g' \
  -e 's,[@]localstatedir[@],$(localstatedir),g' \
  -e 's,[@]pkgstatedir[@],$(pkgstatedir),g' \
  \
  -e 's,[@]applicationsdir[@],$(applicationsdir),g' \
  -e 's,[@]iconsdir[@],$(iconsdir),g' \
  -e 's,[@]sudoersdir[@],$(sudoersdir),g' \
  -e 's,[@]xdgdir[@],$(xdgdir),g' \
  -e 's,[@]thunderbird_extensiondir[@],$(thunderbird_extensiondir),g'

%: %.in
	$(SED) $< > $@ $(subst_rule)

karoshi-%: %.in
	$(SED) $< > $@ $(subst_rule)

karoshi-%: %
	(cd $(dir $@) && $(LN_S) $(notdir $<) $(notdir $@))

################
# core
################

applications_DATA = \
  src/core/applications/karoshi-change-admin-password.desktop \
  src/core/applications/karoshi-manage-flags.desktop \
  src/core/applications/karoshi-set-location.desktop
icons_DATA = \
  src/core/icons/karoshi-change-password.png \
  src/core/icons/karoshi-moodle.png \
  src/core/icons/karoshi-set-location.png \
  src/core/icons/karoshi-set-network.png \
  src/core/icons/karoshi-smalllogo.png

dist_pkgconf_DATA =
dist_pkgconf_variables_DATA = src/core/config/variables/core

pkglibexec_SCRIPTS = \
  src/core/lib/common \
  src/core/lib/session-tools

lib_pam_SCRIPTS = \
  src/core/lib/pam/offline-homes \
  src/core/lib/pam/post-session \
  src/core/lib/pam/pre-session \
  src/core/lib/pam/virtualbox-mkdir \
  src/core/lib/pam/wrapper
lib_post_session_SCRIPTS = \
  src/core/lib/post-session/00core \
  src/core/lib/post-session/02configuration_pre \
  src/core/lib/post-session/05offline \
  src/core/lib/post-session/50configuration
lib_pre_session_SCRIPTS = \
  src/core/lib/pre-session/00core \
  src/core/lib/pre-session/05offline \
  src/core/lib/pre-session/50configuration
lib_services_SCRIPTS = \
  src/core/lib/services/idle-shutdown \
  src/core/lib/services/multicast-listener \
  src/core/lib/services/update
lib_update_SCRIPTS = \
  src/core/lib/update/00core \
  src/core/lib/update/01offline \
  src/core/lib/update/05shutdown

dist_data_offline_DATA = \
  src/core/data/offline/new-offline-user.desktop \
  src/core/data/offline/online-merge.desktop
dist_data_admin_skel_DATA =
dist_data_admin_skel_menus_DATA =

dist_sudoers_DATA = 
dist_xdg_DATA =
dist_xdg_menus_DATA =
dist_xdg_autostart_DATA =

bin_SCRIPTS = \
  src/core/bin/karoshi-manage-flags \
  src/core/bin/karoshi-notify-shutdown \
  src/core/bin/karoshi-set-local-password \
  src/core/bin/karoshi-set-location

CLEANFILES = \
  src/core/lib/common \
  src/core/lib/session-tools \
  src/core/lib/pam/offline-homes \
  src/core/lib/pam/post-session \
  src/core/lib/pam/pre-session \
  src/core/lib/pam/virtualbox-mkdir \
  src/core/lib/pam/wrapper \
  src/core/lib/post-session/00core \
  src/core/lib/post-session/02configuration_pre \
  src/core/lib/post-session/05offline \
  src/core/lib/post-session/50configuration \
  src/core/lib/pre-session/00core \
  src/core/lib/pre-session/05offline \
  src/core/lib/pre-session/50configuration \
  src/core/lib/services/idle-shutdown \
  src/core/lib/services/multicast-listener \
  src/core/lib/services/update \
  src/core/lib/update/00core \
  src/core/lib/update/01offline \
  src/core/lib/update/05shutdown \
  src/core/bin/karoshi-manage-flags \
  src/core/bin/karoshi-notify-shutdown \
  src/core/bin/karoshi-set-local-password \
  src/core/bin/karoshi-set-location \
  src/core/applications/karoshi-change-admin-password.desktop \
  src/core/applications/karoshi-manage-flags.desktop \
  src/core/applications/karoshi-set-location.desktop \
  src/core/icons/karoshi-change-password.png \
  src/core/icons/karoshi-moodle.png \
  src/core/icons/karoshi-set-location.png \
  src/core/icons/karoshi-set-network.png \
  src/core/icons/karoshi-smalllogo.png

EXTRA_DIST = \
  src/core/lib/common.in \
  src/core/lib/session-tools.in \
  src/core/lib/pam/offline-homes.in \
  src/core/lib/pam/post-session.in \
  src/core/lib/pam/pre-session.in \
  src/core/lib/pam/virtualbox-mkdir.in \
  src/core/lib/pam/wrapper.in \
  src/core/lib/post-session/00core.in \
  src/core/lib/post-session/02configuration_pre.in \
  src/core/lib/post-session/05offline.in \
  src/core/lib/post-session/50configuration \
  src/core/lib/pre-session/00core.in \
  src/core/lib/pre-session/05offline.in \
  src/core/lib/pre-session/50configuration \
  src/core/lib/services/idle-shutdown.in \
  src/core/lib/services/multicast-listener.in \
  src/core/lib/services/update.in \
  src/core/lib/update/00core.in \
  src/core/lib/update/01offline.in \
  src/core/lib/update/05shutdown.in \
  src/core/bin/manage-flags.in \
  src/core/bin/notify-shutdown.in \
  src/core/bin/set-local-password.in \
  src/core/bin/set-location.in \
  src/core/applications/change-admin-password.desktop \
  src/core/applications/manage-flags.desktop \
  src/core/applications/set-location.desktop \
  src/core/icons/change-password.png \
  src/core/icons/moodle.png \
  src/core/icons/set-location.png \
  src/core/icons/set-network.png \
  src/core/icons/smalllogo.png

################
# cups
################

cups_backenddir = @cups_libdir@/backend

if CUPS

dist_cups_backend_DATA = src/cups/backend/ksmb
dist_sudoers_DATA += src/cups/sudoers.d/99ksmb

lib_services_SCRIPTS += src/cups/lib/services/cups-config
lib_update_SCRIPTS += src/cups/lib/update/05cups

CLEANFILES += \
  src/cups/lib/services/cups-config \
  src/cups/lib/update/05cups
EXTRA_DIST += \
  src/cups/lib/services/cups-config.in \
  src/cups/lib/update/05cups.in

endif

################
# firefox
################

if FIREFOX

lib_post_session_SCRIPTS += src/firefox/lib/post-session/30firefox
lib_pre_session_SCRIPTS += src/firefox/lib/pre-session/70firefox
lib_update_SCRIPTS += src/firefox/lib/update/20firefox

CLEANFILES += \
  src/firefox/lib/post-session/30firefox \
  src/firefox/lib/pre-session/70firefox \
  src/firefox/lib/update/20firefox
EXTRA_DIST += \
  src/firefox/lib/post-session/30firefox.in \
  src/firefox/lib/pre-session/70firefox.in \
  src/firefox/lib/update/20firefox.in

endif

################
# firewall
################

if FIREWALL

bin_SCRIPTS += src/firewall/bin/karoshi-generate-firewall-rules
lib_update_SCRIPTS += src/firewall/lib/update/04firewall

CLEANFILES += \
  src/firewall/bin/karoshi-generate-firewall-rules \
  src/firewall/lib/update/04firewall
EXTRA_DIST += \
  src/firewall/bin/generate-firewall-rules.in \
  src/firewall/lib/update/04firewall.in

endif

################
# lightdm
################

lightdm_confdir = @lightdm_confdir@
lightdm_themedir = @lightdm_kde_themesdir@
lightdm_theme_karoshidir = $(lightdm_themedir)/karoshi-classic

if LIGHTDM

dist_lightdm_conf_DATA = \
  src/lightdm/config/lightdm.conf \
  src/lightdm/config/lightdm-kde-greeter.conf

dist_lightdm_theme_karoshi_DATA = \
  src/lightdm/theme/config.ui \
  src/lightdm/theme/main.qml \
  src/lightdm/theme/main.xml \
  src/lightdm/theme/preview.png \
  src/lightdm/theme/theme.rc

endif

################
# thunderbird
################

if THUNDERBIRD

install-data-hook:
	$(MKDIR_P) "$(thunderbird_extensiondir)/{9533f794-00b4-4354-aa15-c2bbda6989f8}"
	$(UNZIP) -q "$(srcdir)"/src/thunderbird/extensions/firetray-0.4.6.xpi -d "$(thunderbird_extensiondir)/{9533f794-00b4-4354-aa15-c2bbda6989f8}"

EXTRA_DIST += firetray-0.4.6.xpi

lib_post_session_SCRIPTS += src/thunderbird/lib/post-session/30thunderbird
lib_pre_session_SCRIPTS += src/thunderbird/lib/pre-session/70thunderbird
lib_update_SCRIPTS += src/thunderbird/lib/update/21thunderbird

CLEANFILES += \
  src/thunderbird/lib/post-session/30thunderbird \
  src/thunderbird/lib/pre-session/70thunderbird \
  src/thunderbird/lib/update/21thunderbird
EXTRA_DIST += \
  src/thunderbird/lib/post-session/30thunderbird.in \
  src/thunderbird/lib/pre-session/70thunderbird.in \
  src/thunderbird/lib/update/21thunderbird.in

endif

################
# xfce4
################

gvfs_mountsdir = @gvfs_libdir@/mounts

xdg_xfcedir = $(xdgdir)/xfce4
xdg_xfce_paneldir = $(xdg_xfcedir)/panel
xdg_xfce_xmldir = $(xdg_xfcedir)/xfconf/xfce-perchannel-xml
xdg_Terminaldir = $(xdgdir)/Terminal
xdg_Thunardir = $(xdgdir)/Thunar

if XFCE

if GVFS
dist_gvfs_mounts_DATA = src/xfce4/gvfs/mounts/network.mount
endif

applications_DATA += src/xfce4/applications/karoshi-printing.desktop
bin_SCRIPTS += src/xfce4/bin/karoshi-detect-dvd

dist_data_admin_skel_menus_DATA += src/xfce4/data/admin-skel/.config/menus/xfce-applications.menu

lib_pre_session_SCRIPTS += src/xfce4/lib/pre-session/55xfce4

dist_xdg_DATA += src/xfce4/xdg/user-dirs.conf
dist_xdg_autostart_DATA += src/xfce4/xdg/autostart/detect-dvd.desktop
dist_xdg_menus_DATA += src/xfce4/xdg/menus/xfce-applications.menu

dist_xdg_Terminal_DATA = src/xfce4/xdg/Terminal/terminalrc
dist_xdg_Thunar_DATA = src/xfce4/xdg/Thunar/uca.xml
dist_xdg_xfce_DATA = src/xfce4/xdg/xfce4/helpers.rc
dist_xdg_xfce_panel_DATA = \
  src/xfce4/xdg/xfce4/panel/datetime-7.rc \
  src/xfce4/xdg/xfce4/panel/default.xml
dist_xdg_xfce_xml_DATA = \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/thunar-volman.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-notifyd.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/thunar.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml \
  src/xfce4/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml

CLEANFILES += \
  src/xfce4/bin/karoshi-detect-dvd \
  src/xfce4/lib/pre-session/55xfce4 \
  src/xfce4/applications/karoshi-printing.desktop
EXTRA_DIST += \
  src/xfce4/bin/detect-dvd.in \
  src/xfce4/lib/pre-session/55xfce4.in \
  src/xfce4/applications/printing.desktop
endif
