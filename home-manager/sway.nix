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
    pkgs.grimblast
  ];
  wayland.windowManager.sway = {
    package = null;
    config = null;
    checkConfig = false;
    systemd.xdgAutostart = true;
    extraConfig = ''
      exec wl-clipboard &
      exec wl-clip-persist --clipboard regular &
      # Replaced with systemd services
      # exec nm-applet --indicator &
      # exec dunst &
      exec firefox &
      exec foot --server &

      font pango:${config.local.theming.font.name} ${toString config.local.theming.font.size} 

      ### Variables
      set $mod Mod4

      set $left h
      set $down j
      set $up k
      set $right l

      set $term footclient
      # set $menu wofi -I --show drun | xargs swaymsg exec --
      set $menu tofi-drun --terminal=footclient | xargs -r swaymsg exec -- 

      ### Appearance
      # class                   border      background  text        indicator   child_border
      client.background                     ${matu.surface} 
      client.focused            ${matu.surface}     ${matu.surface_container_highest}     ${matu.primary}     ${matu.surface}     ${matu.surface}
      client.focused_inactive   ${matu.surface}     ${matu.surface_container_highest}     ${matu.primary}     ${matu.surface}     ${matu.surface}
      client.focused_tab_title  ${matu.surface}     ${matu.surface_container_highest}     ${matu.primary}
      client.unfocused          ${matu.surface}     ${matu.surface}     ${matu.on_surface}     ${matu.surface}     ${matu.surface}
      client.urgent             ${matu.surface}     ${matu.surface}     ${matu.error}     ${matu.surface}     ${matu.surface}
      client.placeholder        ${matu.surface}     ${matu.surface}     ${matu.error}     ${matu.surface}     ${matu.surface}

      corner_radius 8
      gaps inner 2
      gaps outer 2
      default_border none
      default_floating_border none
      smart_gaps on
      # blur on

      ### Assign
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
      #
      # Basics:
      #
          bindsym $mod+Return exec $term
          bindsym $mod+q kill
          bindsym $mod+space exec $menu
          floating_modifier $mod normal
          bindsym $mod+Shift+c reload
          bindsym $mod+x exec powermenu
      #
      # Moving around:
      #
          bindsym $mod+$left focus left
          bindsym $mod+$down focus down
          bindsym $mod+$up focus up
          bindsym $mod+$right focus right

          bindsym $mod+Left focus left
          bindsym $mod+Down focus down
          bindsym $mod+Up focus up
          bindsym $mod+Right focus right

          bindsym $mod+Shift+$left move left
          bindsym $mod+Shift+$down move down
          bindsym $mod+Shift+$up move up
          bindsym $mod+Shift+$right move right

          bindsym $mod+Shift+Left move left
          bindsym $mod+Shift+Down move down
          bindsym $mod+Shift+Up move up
          bindsym $mod+Shift+Right move right
      #
      # Workspaces:
      #
          # Switch to workspace
          bindsym $mod+1 workspace number 1
          bindsym $mod+2 workspace number 2
          bindsym $mod+3 workspace number 3
          bindsym $mod+4 workspace number 4
          bindsym $mod+5 workspace number 5
          bindsym $mod+6 workspace number 6
          bindsym $mod+7 workspace number 7
          bindsym $mod+8 workspace number 8
          bindsym $mod+9 workspace number 9
          bindsym $mod+0 workspace number 10

          # Move focused container to workspace
          bindsym $mod+Shift+1 move container to workspace number 1
          bindsym $mod+Shift+2 move container to workspace number 2
          bindsym $mod+Shift+3 move container to workspace number 3
          bindsym $mod+Shift+4 move container to workspace number 4
          bindsym $mod+Shift+5 move container to workspace number 5
          bindsym $mod+Shift+6 move container to workspace number 6
          bindsym $mod+Shift+7 move container to workspace number 7
          bindsym $mod+Shift+8 move container to workspace number 8
          bindsym $mod+Shift+9 move container to workspace number 9
          bindsym $mod+Shift+0 move container to workspace number 10
      #
      # Layout stuff:
      #
          bindsym $mod+b splith
          bindsym $mod+v splitv

          bindsym $mod+s layout stacking
          bindsym $mod+w layout tabbed
          bindsym $mod+e layout toggle split

          bindsym $mod+f fullscreen
          bindsym $mod+Shift+space floating toggle
          bindsym $mod+t focus mode_toggle
          bindsym $mod+a focus parent
      #
      # Scratchpad:
      #
          bindsym $mod+Shift+minus move scratchpad
          bindsym $mod+minus scratchpad show
      #
      # Resizing containers:
      #
      mode "resize" {
          bindsym $left resize shrink width 10px
          bindsym $down resize grow height 10px
          bindsym $up resize shrink height 10px
          bindsym $right resize grow width 10px

          bindsym Left resize shrink width 10px
          bindsym Down resize grow height 10px
          bindsym Up resize shrink height 10px
          bindsym Right resize grow width 10px

          bindsym Return mode "default"
          bindsym Escape mode "default"
      }
      bindsym $mod+r mode "resize"

      #
      # Screenshot and Volume
      #
          bindsym Print exec grimblast --notify copysave
          bindsym Shift+Print exec grimblast --notify copysave area
          bindsym XF86AudioRaiseVolume exec changevolume up 5
          bindsym XF86AudioLowerVolume exec changevolume down 5
          bindsym XF86AudioMute exec changevolume mute

      #
      # Status Bar:
      #
      bar {
        swaybar_command waybar
      }
    '';
  };
}
