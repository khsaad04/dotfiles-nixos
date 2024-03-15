{ lib, config, pkgs, ... }:
let cfg = config.editors.nvim;
in {
  options.editors.nvim = {
    enable = lib.mkEnableOption "Neovim";
    package = lib.mkPackageOption pkgs "neovim-unwrapped" { };
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      package = cfg.package;

      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      withNodeJs = true;

      extraPackages = with pkgs; [
        tree-sitter
        ripgrep
        fd
        unzip
        wl-clipboard
        gcc13
        gnumake42

        # LSPs, Formatters and Linters
        lua-language-server
        stylua
        nil
        ruff
        python311Packages.python-lsp-server
        python311Packages.black
        python311Packages.isort
      ];
    };

    xdg.configFile."nvim" = {
      source = ./.;
      recursive = true;
    };
  };
}
