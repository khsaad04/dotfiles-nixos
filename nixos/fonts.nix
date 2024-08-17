{ pkgs, ... }:
{
  fonts = {
    packages =
      let
        nerdfonts = pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; };
      in
      [
        pkgs.noto-fonts
        pkgs.iosevka
        nerdfonts
      ];
    fontconfig = {
      defaultFonts =
        let
          common = [
            "Iosevka"
            "Symbols Nerd Font"
            "Noto Color Emoji"
          ];
        in
        {
          monospace = [ "Noto Sans Bengali" ] ++ common;
          serif = [ "Noto Serif Bengali" ] ++ common;
          sansSerif = [ "Noto Sans Bengali" ] ++ common;
          emoji = common;
        };
    };
  };
}
