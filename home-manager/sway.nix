{
  lib,
  pkgs,
  config,
  ...
}:
let
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  home.packages = lib.mkIf config.wayland.windowManager.sway.enable [
    pkgs.wl-clip-persist
    pkgs.findutils
    pkgs.sway-contrib.grimshot
  ];
  wayland.windowManager.sway = {
    package = null;
    config = null;
    checkConfig = false;
    systemd.xdgAutostart = true;
    extraConfig = ''
      ### Exec stuff
      bar swaybar_command waybar
      exec {
        firefox &
        foot --server &
        # Replaced with systemd services
        # nm-applet --indicator &
        # dunst &
        wl-clipboard &
        wl-clip-persist --clipboard regular &
      }

      ### Variables
      set {
        $mod Mod4

        $left h
        $down j
        $up k
        $right l

        $term footclient
        $menu tofi-drun --terminal=footclient | xargs -r swaymsg exec -- 
      }

      ### Appearance
      # class                   border      background  text        indicator   child_border
      client.background                     ${matu.surface} 
      client.focused            ${matu.surface}     ${matu.surface_container_highest}     ${matu.primary}     ${matu.surface}     ${matu.surface}
      client.focused_inactive   ${matu.surface}     ${matu.surface_container_highest}     ${matu.primary}     ${matu.surface}     ${matu.surface}
      client.focused_tab_title  ${matu.surface}     ${matu.surface_container_highest}     ${matu.primary}
      client.unfocused          ${matu.surface}     ${matu.surface}     ${matu.on_surface}     ${matu.surface}     ${matu.surface}
      client.urgent             ${matu.surface}     ${matu.surface}     ${matu.error}     ${matu.surface}     ${matu.surface}
      client.placeholder        ${matu.surface}     ${matu.surface}     ${matu.error}     ${matu.surface}     ${matu.surface}

      font pango:${config.local.theming.font.name} ${toString (config.local.theming.font.size - 2)} 
      gaps {
        inner 2
        outer 2
      }
      default_border none
      default_floating_border none
      smart_gaps on

      ### Window Rules
      assign [app_id="firefox"] 2

      ### Output configuration
      output * bg ${config.local.theming.wallpaper} fill

      ### Input configuration
      input "type:pointer" {
        accel_profile flat
        pointer_accel 0
      }

      input "type:keyboard" {
        xkb_options caps:escape
      }

      seat "*" {
          xcursor_theme ${config.local.theming.cursor.name} ${toString config.local.theming.cursor.size}
      }

      ### Key bindings
      floating_modifier $mod normal
      bindsym {
        # Basics:
        $mod+Return exec $term
        $mod+q kill
        $mod+space exec $menu
        $mod+Shift+c reload
        $mod+x exec powermenu

        # Moving around:
        $mod+$left focus left
        $mod+$down focus down
        $mod+$up focus up
        $mod+$right focus right

        $mod+Left focus left
        $mod+Down focus down
        $mod+Up focus up
        $mod+Right focus right

        $mod+Shift+$left move left
        $mod+Shift+$down move down
        $mod+Shift+$up move up
        $mod+Shift+$right move right

        $mod+Shift+Left move left
        $mod+Shift+Down move down
        $mod+Shift+Up move up
        $mod+Shift+Right move right

        # Workspaces:
        # Switch to workspace
        $mod+1 workspace number 1
        $mod+2 workspace number 2
        $mod+3 workspace number 3
        $mod+4 workspace number 4
        $mod+5 workspace number 5
        $mod+6 workspace number 6
        $mod+7 workspace number 7
        $mod+8 workspace number 8
        $mod+9 workspace number 9
        $mod+0 workspace number 10

        # Move focused container to workspace
        $mod+Shift+1 move container to workspace number 1
        $mod+Shift+2 move container to workspace number 2
        $mod+Shift+3 move container to workspace number 3
        $mod+Shift+4 move container to workspace number 4
        $mod+Shift+5 move container to workspace number 5
        $mod+Shift+6 move container to workspace number 6
        $mod+Shift+7 move container to workspace number 7
        $mod+Shift+8 move container to workspace number 8
        $mod+Shift+9 move container to workspace number 9
        $mod+Shift+0 move container to workspace number 10

        # Layout stuff:
        $mod+b splith
        $mod+v splitv

        $mod+s layout stacking
        $mod+w layout tabbed
        $mod+e layout toggle split

        $mod+f fullscreen
        $mod+Shift+space floating toggle
        $mod+t focus mode_toggle
        $mod+a focus parent

        # Scratchpad:
        $mod+Shift+minus move scratchpad
        $mod+minus scratchpad show

        # Screenshot and Volume
        --no-repeat Print exec grimshot --notify savecopy
        --no-repeat Shift+Print exec grimshot --notify savecopy area
        --no-repeat Ctrl+Print exec grimshot --notify savecopy window
        XF86AudioRaiseVolume exec changevolume up 5
        XF86AudioLowerVolume exec changevolume down 5
        XF86AudioMute exec changevolume mute
      }

      # Resizing containers:
      mode "resize" {
        bindsym {
          $left resize shrink width 10px
          $down resize grow height 10px
          $up resize shrink height 10px
          $right resize grow width 10px

          Left resize shrink width 10px
          Down resize grow height 10px
          Up resize shrink height 10px
          Right resize grow width 10px

          Return mode "default"
          Escape mode "default"
        }
      }
      bindsym $mod+r mode "resize"
    '';
  };
}
