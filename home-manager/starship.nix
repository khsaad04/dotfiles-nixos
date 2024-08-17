{ lib, config, ... }:
let
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      format = lib.concatStrings [
        "[](fg:${matu.primary})"
        "$username"
        "[](fg:${matu.primary} bg:${matu.primary_container})"
        "$directory"
        "[](fg:${matu.primary_container})"
        "$all"
        "$cmd_duration"
        "\n$character"
      ];
      username = {
        style_user = "bold fg:${matu.on_primary} bg:${matu.primary}";
        style_root = "bold fg:${matu.on_primary} bg:${matu.primary}";
        format = "[$user]($style)";
        show_always = true;
      };
      directory = {
        style = "bold fg:${matu.on_primary_container} bg:${matu.primary_container}";
        read_only_style = "bold fg:${matu.on_primary_container} bg:${matu.primary_container}";
        format = "[[ $path]($style)[$read_only]($read_only_style)](bg:surface1)";
      };
      line_break = {
        disabled = true;
      };
      python = {
        symbol = " ";
      };
      git_branch = {
        format = " [$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
        style = "bold ${matu.on_primary_container}";
      };
      cmd_duration = {
        format = " took [$duration]($style)";
      };
      character = {
        success_symbol = "[❯](bold ${matu.primary})";
        error_symbol = "[❯](bold ${matu.error})";
      };
    };
  };
}
