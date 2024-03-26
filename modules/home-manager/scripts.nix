{ pkgs, ... }:
let
  changevolume = pkgs.writeShellScriptBin "changevolume" ''
    case $1 in
    up)
        ${pkgs.pamixer}/bin/pamixer -u
        ${pkgs.pamixer}/bin/pamixer -i 5 --allow-boost
        ;;
    down)
        ${pkgs.pamixer}/bin/pamixer -u
        ${pkgs.pamixer}/bin/pamixer -d 5 --allow-boost
        ;;
    mute)
        ${pkgs.pamixer}/bin/pamixer -t
        ;;
    esac

    volume=$(${pkgs.pamixer}/bin/pamixer --get-volume)
    if $(${pkgs.pamixer}/bin/pamixer --get-mute); then
        ${pkgs.dunst}/bin/dunstify -i volume-mute -a "changevolume" -t 2000 -r 9993 -u low "Muted"
    else
        ${pkgs.dunst}/bin/dunstify -a "changevolume" -u low -r "9993" -h int:value:"$volume" -i "volume-$1" "Volume: $volume%" -t 2000
    fi
  '';

  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    entries="󰗼 Exit\n Shutdown\n⏾ Suspend\n󰒲 Hibernate\n Reboot"

    selected=$(echo -e $entries|${pkgs.wofi}/bin/wofi --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

    case $selected in
        exit)
            hyprctl dispatch exit || swaymsg exit;;
        shutdown)
            systemctl poweroff;;
        suspend)
            systemctl suspend;;
        hibernate)
            systemctl hibernate;;
        reboot)
            systemctl reboot;;
    esac
  '';
in
{
  home.packages = [ changevolume powermenu ];
}
