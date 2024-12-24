{ pkgs, ... }:
{
  fonts = {
    packages = [
      pkgs.noto-fonts
      pkgs.iosevka
      pkgs.nerd-fonts.symbols-only
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
