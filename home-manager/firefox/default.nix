{ pkgs, config, ... }:
{
  programs.firefox = {
    package = pkgs.firefox-bin;
    profiles.${config.home.username} = {
      name = config.home.username;
      isDefault = true;
      search = {
        force = true;
        default = "DuckDuckGo";
      };
      extensions = with config.nur.repos.rycee.firefox-addons; [
        ublock-origin
        vimium
        adaptive-tab-bar-colour
      ];
      extraConfig = ''
        ${builtins.readFile ./user.js}
      '';
      userChrome = ''
        ${builtins.readFile ./userChrome.css}
      '';
    };
  };
}
