{
  username,
  firefox-addons,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.${username} = {
      name = username;
      extensions = with firefox-addons; [
        ublock-origin
        firefox-color
        vimium
      ];
    };
  };
}
