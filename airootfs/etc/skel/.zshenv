# Trivial environment variables
export NNN_OPTS='de'
export NNN_COLORS=2136
export MICRO_TRUECOLOR=1
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export GOBIN="${HOME}/.bin"
export EDITOR='/usr/bin/nvim'

# Set options only if user x0rzavi or otherwise
if [[ $(whoami) = 'x0rzavi' ]]; then
	# Description: Hack to set gtk4 theme
	# Reference: https://reddit.com/tnj493
	# Reference: https://wiki.archlinux.org/title/GTK#Themes
	export GTK_THEME=Colloid:dark

	# Description: Wayland quirks
	# Reference: https://github.com/jbuchermn/newm/blob/master/doc/env_wayland.md
	# Reference: https://wiki.archlinux.org/title/wayland#SDL2
	# Reference: https://wiki.archlinux.org/title/wayland#Qt
	# Reference: https://wiki.archlinux.org/title/firefox#Wayland
	# GTK
	export GDK_BACKEND=wayland
	export TDESKTOP_DISABLE_GTK_INTEGRATION=1
	export CLUTTER_BACKEND=wayland
	export BEMENU_BACKEND=wayland

	# Qt
	export QT_QPA_PLATFORM=wayland-egl
	export QT_STYLE_OVERRIDE=kvantum
	# export QT_WAYLAND_FORCE_DPI=physical
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

	# Elementary
	export ELM_DISPLAY=wl
	export ECORE_EVAS_ENGINE=wayland_egl
	export ELM_ENGINE=wayland_egl
	export ELM_ACCEL=opengl
	export ELM_SCALE=1

	# SDL
	export SDL_VIDEODRIVER=wayland

	# Firefox
	# Reference: https://fedoraproject.org/wiki/Firefox_Hardware_acceleration
	# Note: not needed as of version > 103
	#export MOZ_LOG="PlatformDecoderModule:5"
	#export MOZ_DISABLE_RDD_SANDBOX=1
	# Note: not needed as of version > 102
	#export MOZ_ENABLE_WAYLAND=1

	# Java
	export _JAVA_AWT_WM_NONREPARENTING=1

	# Misc
	# Reference: https://wiki.archlinux.org/title/GTK#Suppress_warning_about_accessibility_bus
	export NO_AT_BRIDGE=1
	export WINIT_UNIX_BACKEND=wayland
fi
