{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (lib.types)
    int
    path
    str
    package
    attrsOf
    ;
  inherit (lib) mkOption mkEnableOption mkPackageOption;
  gencolor = pkgs.writers.writePython3Bin "gencolor" { } ''
    import json
    import sys

    source_color = sys.argv[1]


    def color_mix(color1, color2, weight):
        w = weight * 2 - 1
        w1 = (w / 2) + 0.5
        w2 = 1 - w1
        c1_r = int(color1[1:3], 16)
        c1_g = int(color1[3:5], 16)
        c1_b = int(color1[5:7], 16)
        c2_r = int(color2[1:3], 16)
        c2_g = int(color2[3:5], 16)
        c2_b = int(color2[5:7], 16)
        r = hex(int(c1_r * w1 + c2_r * w2))[2:]
        g = hex(int(c1_g * w1 + c2_g * w2))[2:]
        b = hex(int(c1_b * w1 + c2_b * w2))[2:]
        return f"#{r}{g}{b}"


    base16 = {
        "base0": "#000000",
        "base1": "#ff0000",
        "base2": "#00ff00",
        "base3": "#ffff00",
        "base4": "#0000ff",
        "base5": "#ff00ff",
        "base6": "#00ffff",
        "base7": "#ffffff",
        "base8": "#000000",
        "base9": "#ff0000",
        "base10": "#00ff00",
        "base11": "#ffff00",
        "base12": "#0000ff",
        "base13": "#ff00ff",
        "base14": "#00ffff",
        "base15": "#ffffff",
    }

    base16_tinted = {}

    for key, value in base16.items():
        weight = 0.3
        if int(key[4:]) > 7:
            weight = 0.5
        new_color = color_mix(value, source_color, weight)
        base16_tinted.update({f"{key}": f"{new_color}"})

    print(json.dumps(base16_tinted))
  '';
  base16Package = pkgs.runCommandLocal "base16-gen" { } ''
    mkdir -p $out
    cd $out
    export HOME=$(pwd)

    ${gencolor}/bin/gencolor "${config.programs.matugen.theme.colors.colors.dark.primary}" > $out/theme.json
  '';
  colors = builtins.fromJSON (builtins.readFile "${base16Package}/theme.json");
in
{
  options.local.theming = {
    enable = mkEnableOption "Enable theming options";
    font = {
      name = mkOption {
        type = str;
        default = "Iosevka";
      };
      size = mkOption {
        type = int;
        default = 10;
      };
    };
    icon = {
      name = mkOption {
        type = str;
        default = "Adwaita";
      };
      package = mkPackageOption pkgs "adwaita-icon-theme" { };
      extra_path = mkOption {
        type = path;
        readOnly = true;
        default = ./icons;
      };
    };
    cursor = {
      name = mkOption {
        type = str;
        default = "Adwaita";
      };
      package = mkOption {
        type = package;
        default = pkgs.adwaita-icon-theme;
      };
      size = mkOption {
        type = int;
        default = 10;
      };
    };
    colorPalette = mkOption {
      type = attrsOf str;
      default = colors;
    };
    wallpaper = mkOption {
      type = str;
      default = "${./wallpapers/wp.png}";
    };
    wallpath = mkOption {
      type = path;
      readOnly = true;
      default = ./wallpapers;
    };
  };
}
