{ lib
, config
, ...
}:
let
  clr = config.colorScheme.palette;
in
{
  programs.starship = {
    enableTransience = true;
    settings = {
      format = lib.concatStrings [
        "[](fg:#${clr.base0D})"
        "$username"
        "[](fg:#${clr.base0D} bg:#${clr.base03})"
        "$directory"
        "[](fg:#${clr.base03})"
        "$all"
        "$cmd_duration"
        "\n$character"
      ];
      username = {
        style_user = "bold fg:#${clr.base01} bg:#${clr.base0D}";
        style_root = "bold fg:#${clr.base0A} bg:#${clr.base0D}";
        format = "[$user]($style)";
        show_always = true;
      };
      directory = {
        style = "bold fg:#${clr.base0D} bg:#${clr.base03}";
        read_only_style = "bold fg:#${clr.base0D} bg:#${clr.base03}";
        format = "[[ $path]($style)[$read_only]($read_only_style)](bg:surface1)";
      };
      line_break = { disabled = true; };
      python = { symbol = " "; };
      git_branch = {
        format = " [$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
        style = "bold #${clr.base0D}";
      };
      cmd_duration = {
        format = " took [$duration]($style)";
      };
    };
  };
}
