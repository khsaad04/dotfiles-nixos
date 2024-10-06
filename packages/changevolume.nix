{ writeShellApplication }:
writeShellApplication {
  name = "changevolume";
  text = ''
    amount=$2
    id_output="8052"
    timeout=2000
    is_muted_output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '[]')

    function notification_bar {
        notify-send -u low -r "$id" -a "$header" -i "$icon" -h int:value:"$volume" "$text" -t $timeout
    }

    function notification_mute {
        notify-send "$text" -u low -r $id -a "$header" -i "$icon" -t $timeout
    }

    case $1 in
    # Output
    up)
    	wpctl set-volume @DEFAULT_AUDIO_SINK@ "$amount"%+
        volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '0-9' | sed 's/^0\{1,2\}//')
        header="Volume"
        text="Currently at $volume%"
        icon="vol-up"
        id=$id_output
    	notification_bar;;

    down)
    	wpctl set-volume @DEFAULT_AUDIO_SINK@ "$amount"%-
        volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '0-9' | sed 's/^0\{1,2\}//')
        header="Volume"
        text="Currently at $volume%"
        icon="vol-down"
        id=$id_output
    	notification_bar;;

    mute)
        echo "$is_muted_output"
        if [ "$is_muted_output" == "[]" ]; then
            header="Volume"
            text="Unmuted."
            icon="vol"
            id=$id_output
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            notification_mute
        else
            header="Volume"
            text="Muted."
            icon="vol-muted"
            id=$id_output
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            notification_mute
        fi;;
    esac
  '';
}
