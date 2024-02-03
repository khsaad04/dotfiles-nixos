{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    settings = {
      format = lib.concatStrings [
        "[](fg:blue)"
        "$username"
        "[](fg:blue bg:surface1)"
        "$directory"
        "[](fg:surface1 bg:base)"
        "$all"
        "$cmd_duration"
        "\n$character"
      ];
      palette = "catppuccin_mocha";
      username = {
        style_user = "bold fg:crust bg:blue";
        style_root = "bold fg:yellow bg:blue";
        format = "[$user]($style)";
        show_always = true;
      };
      directory = {
        style = "bold fg:blue bg:surface1";
        read_only_style = "bold fg:blue bg:surface1";
        format = "[ [$path]($style)[$read_only]($read_only_style)](bg:surface1)";
      };
      line_break = { disabled = true; };
      python = { symbol = " "; };
      git_branch = {
        format = " [$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
        style = "bold blue";
      };
      cmd_duration = {
        format = " took [$duration]($style)";
      };
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}
