{pkgs, ...}: {
  home.packages = with pkgs; [swww networkmanagerapplet grimblast];
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      include ${pkgs.sway}/etc/sway/config.d/*

      exec ${pkgs.wl-clipboard}/bin/wl-clipboard &
      exec ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &
      exec ${pkgs.firefox}/bin/firefox &
      exec ${pkgs.swww}/bin/swww init && ${pkgs.swww}/bin/swww img ${./wallpaper}/wp.png &

      font pango: FiraCode Nerd Regular 10

      gaps inner 5
      gaps outer 0

      default_border none

      #                       <border>    <bg>        <text>      <indicator> <child_border>
      client.focused          #89b4fa     #000000     #ffffff     #89b4fa     #89b4fa
      client.focused_inactive #000000     #000000     #ffffff     #000000     #000000
      client.unfocused        #11111b     #000000     #ffffff     #11111b     #11111b
      client.urgent           #ff0000     #000000     #ffffff     #ff0000     #ff0000


      ### Variables

      set {
          $mod Mod4

          $left h
          $down j
          $up k
          $right l

          $term ${pkgs.foot}/bin/foot

          $menu ${pkgs.wofi}/bin/wofi -I --show drun | ${pkgs.findutils}/bin/xargs swaymsg exec --
      }

      ### Input configuration

      input "type:mouse" {
          accel_profile flat
      }

      ### Key bindings

      # Drag floating windows by holding down $mod and left mouse button.
      # Resize them with right mouse button + $mod.
      # Despite the name, also works for non-floating windows.
      # Change normal to inverse to use left mouse button for resizing and right
      floating_modifier $mod normal

      bindsym {
      #
      # Basics:
      #
          # Start a terminal
          $mod+Return exec $term

          # Kill focused window
          $mod+q kill

          # Start your launcher
          $mod+space exec $menu

          # Reload the configuration file
          $mod+Shift+c reload

          # Power Menu
          $mod+x exec powermenu
      #
      # Moving around:
      #
          # Move your focus around
          $mod+$left focus left
          $mod+$down focus down
          $mod+$up focus up
          $mod+$right focus right
          # Or use $mod+[up|down|left|right]
          $mod+Left focus left
          $mod+Down focus down
          $mod+Up focus up
          $mod+Right focus right

          # Move the focused window with the same, but add Shift
          $mod+Shift+$left move left
          $mod+Shift+$down move down
          $mod+Shift+$up move up
          $mod+Shift+$right move right
          # Ditto, with arrow keys
          $mod+Shift+Left move left
          $mod+Shift+Down move down
          $mod+Shift+Up move up
          $mod+Shift+Right move right
      #
      # Workspaces:
      #
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
          # Note: workspaces can have any name you want, not just numbers.
          # We just use 1-10 as the default.
      #
      # Layout stuff:
      #

          # You can "split" the current object of your focus with
          # $mod+b or $mod+v, for horizontal and vertical splits
          # respectively.
          $mod+b splith
          $mod+v splitv

          # Switch the current container between different layout styles
          $mod+s layout stacking
          $mod+w layout tabbed
          $mod+e layout toggle split

          # Make the current focus fullscreen
          $mod+f fullscreen

          # Toggle the current focus between tiling and floating mode
          $mod+Shift+space floating toggle

          # Swap focus between the tiling area and the floating area
          $mod+Ctrl+space focus mode_toggle

          # Move focus to the parent container
          $mod+a focus parent
      #
      # Scratchpad:
      #
          # Sway has a "scratchpad", which is a bag of holding for windows.
          # You can send windows there and get them back later.

          # Move the currently focused window to the scratchpad
          $mod+Shift+minus move scratchpad

          # Show the next scratchpad window or hide the focused scratchpad window.
          # If there are multiple scratchpad windows, this command cycles through them.
          $mod+minus scratchpad show
      #
      # Volume & Print keybinds
      #
          Print exec ${pkgs.grimblast}/bin/grimblast --notify copysave
          Shift+Print exec ${pkgs.grimblast}/grimblast --notify copysave area

          XF86AudioRaiseVolume exec changevolume up
          XF86AudioLowerVolume exec changevolume down
          XF86AudioMute exec changevolume mute
      #
      # Resizing containers:
      #
      mode "resize" {
          # left will shrink the containers width
          # right will grow the containers width
          # up will shrink the containers height
          # down will grow the containers height
          bindsym $left resize shrink width 10px
          bindsym $down resize grow height 10px
          bindsym $up resize shrink height 10px
          bindsym $right resize grow width 10px

          # Ditto, with arrow keys
          bindsym Left resize shrink width 10px


          bindsym Down resize grow height 10px
          bindsym Up resize shrink height 10px
          bindsym Right resize grow width 10px

          # Return to default mode
          bindsym Return mode "default"
          bindsym Escape mode "default"
      }
      bindsym $mod+r mode "resize"

      #
      # Window Rules
      #
      assign {
          [app_id="firefox"] workspace number 2
          [class="Spotify"] workspace number 3
      }

      #
      # Status Bar:
      #
      bar {
          swaybar_command ${pkgs.waybar}/bin/waybar
      }
    '';
  };
}
