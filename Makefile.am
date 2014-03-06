applicationsdir = $(datadir)/applications
iconsdir = $(datadir)/pixmaps

configdir = $(sysconfdir)/karoshi-client
config_variablesdir = $(configdir)/variables

lib_pamdir = $(pkglibexecdir)/pam
lib_updatedir = $(pkglibexecdir)/update
lib_servicesdir = $(pkglibexecdir)/services
lib_pre_sessiondir = $(pkglibexecdir)/pre-session
lib_post_sessiondir = $(pkglibexecdir)/post-session

data_offlinedir = $(pkgdata)/offline
data_admin_skeldir = $(pkgdata)/admin-skel
data_admin_skel_menusdir = $(data_admin_skeldir)/.config/menus

sudoersdir = $(sysconfdir)/sudoers.d

xdgdir = $(sysconfdir)/xdg
xdg_menusdir = $(xdgdir)/menus
xdg_autostartdir = $(xdgdir)/autostart

#Substitution rule

AM_DEFAULT_SOURCE_EXT = .in

%: %.in
	sed $< > $@ \
	  -e '/@makefile_in@/d' \
	  -e 's,@prefix@,$(prefix),g' \
	  -e 's,@bindir@,$(bindir),g' \
	  -e 's,@libdir@,$(libdir),g' \
	  -e 's,@pkglibdir@,$(pkglibdir),g' \
	  -e 's,@pkglibexecdir@,$(pkglibexecdir),g' \
	  -e 's,@datadir@,$(datadir),g' \
	  -e 's,@pkgdatadir@,$(pkgdatadir),g' \
	  -e 's,@mandir@,$(mandir),g' \
	  -e 's,@infodir@,$(infodir),g' \
	  -e 's,@docdir@,$(docdir),g' \
	  -e 's,@sysconfdir@,$(sysconfdir),g' \
	  -e 's,@localstatedir@,$(localstatedir),g' \
	  \
	  -e 's,@applicationsdir@,$(applicationsdir),g' \
	  -e 's,@iconsdir@,$(iconsdir),g' \
	  -e 's,@configdir@,$(configdir),g' \
	  -e 's,@sudoersdir@,$(sudoersdir),g' \
	  -e 's,@xdgdir@,$(xdgdir),g'


################
# core
################

dist_applications_DATA = \
  src/core/applications/change-admin-password.desktop \
  src/core/applications/manage-flags.desktop \
  src/core/applications/set-location.desktop
dist_icons_DATA = \
  src/core/icons/change-password.png \
  src/core/icons/moodle.png \
  src/core/icons/set-location.png \
  src/core/icons/set-network.png \
  src/core/icons/smalllogo.png

dist_config_DATA =
dist_config_variables_DATA = src/core/config/variables/core

pkglibexec_PROGRAMS = \
  src/core/lib/common \
  src/core/lib/session-tools

lib_pam_PROGRAMS = \
  src/core/lib/pam/offline-homes \
  src/core/lib/pam/post-session \
  src/core/lib/pam/pre-session \
  src/core/lib/pam/virtualbox-mkdir \
  src/core/lib/pam/wrapper
lib_post_session_PROGRAMS = \
  src/core/lib/post-session/00core \
  src/core/lib/post-session/02configuration_pre \
  src/core/lib/post-session/05offline \
  src/core/lib/post-session/50configuration
lib_pre_session_PROGRAMS = \
  src/core/lib/pre-session/00core \
  src/core/lib/pre-session/05offline \
  src/core/lib/pre-session/50configuration
lib_services_PROGRAMS = \
  src/core/lib/services/idle-shutdown \
  src/core/lib/services/multicast-listener \
  src/core/lib/services/update
lib_update_PROGRAMS = \
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

bin_PROGRAMS = \
  src/core/bin/manage-flags \
  src/core/bin/notify-shutdown \
  src/core/bin/set-local-password \
  src/core/bin/set-location

################
# cups
################

cups_backenddir = $(libdir)/cups/backend

dist_cups_backend_DATA = src/cups/backend/ksmb
dist_sudoers_DATA += src/cups/sudoers.d/99ksmb

lib_services_PROGRAMS += src/cups/lib/services/cups-config
lib_update_PROGRAMS += src/cups/lib/update/05cups

################
# firefox
################

lib_post_session_PROGRAMS += src/firefox/lib/post-session/30firefox
lib_pre_session_PROGRAMS += src/firefox/lib/pre-session/70firefox
lib_update_PROGRAMS += src/firefox/lib/update/20firefox

################
# firewall
################

bin_PROGRAMS += src/firewall/bin/generate-firewall-rules
lib_update_PROGRAMS += src/firewall/lib/update/04firewall

################
# lightdm
################

lightdm_confdir = $(sysconfdir)/lightdm
lightdm_themedir = $(datadir)/kde4/apps/lightdm-kde-greeter/themes
lightdm_theme_karoshidir = $(lightdm_themedir)/karoshi-classic

dist_lightdm_conf_DATA = \
  src/lightdm/config/lightdm.conf \
  src/lightdm/config/lightdm-kde-greeter.conf

dist_lightdm_theme_karoshi_DATA = \
  src/lightdm/theme/config.ui \
  src/lightdm/theme/main.qml \
  src/lightdm/theme/main.xml \
  src/lightdm/theme/preview.png \
  src/lightdm/theme/theme.rc

################
# thunderbird
################

thunderbird_extensiondir = /usr/lib/mozilla/extensions/{3550f703-e582-4d05-9a08-453d09bdfdc6}

install-data-hook:
	$(MKDIR_P) "$(thunderbird_extensiondir)/{9533f794-00b4-4354-aa15-c2bbda6989f8}"
	$(UNZIP) -q "$(srcdir)"/src/thunderbird/extensions/firetray-0.4.6.xpi -d "$(thunderbird_extensiondir)/{9533f794-00b4-4354-aa15-c2bbda6989f8}"

EXTRA_DIST = firetray-0.4.6.xpi

lib_post_session_PROGRAMS += src/thunderbird/lib/post-session/30thunderbird
lib_pre_session_PROGRAMS += src/thunderbird/lib/pre-session/70thunderbird
lib_update_PROGRAMS += src/thunderbird/lib/update/21thunderbird

################
# xfce4
################

gvfs_mountsdir = $(libdir)/gvfs/mounts

xdg_xfcedir = $(xdgdir)/xfce4
xdg_xfce_paneldir = $(xdg_xfcedir)/panel
xdg_xfce_xmldir = $(xdg_xfcedir)/xfconf/xfce-perchannel-xml
xdg_Terminaldir = $(xdgdir)/Terminal
xdg_Thunardir = $(xdgdir)/Thunar

dist_applications_DATA += printing.desktop
bin_PROGRAMS += detect-dvd

dist_gvfs_mounts_DATA = src/xfce4/gvfs/mounts/network.mount

dist_data_admin_skel_menus_DATA += src/xfce4/data/admin-skel/.config/menus/xfce-applications.menu

lib_pre_session_PROGRAMS += src/xfce4/lib/pre-session/55xfce4

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
