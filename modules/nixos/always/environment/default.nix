{...}: {
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NH_FLAKE = "/home/vic/Git/xxheyhey/nixos-xx";

      EDITOR = "nvim";
      VISUAL = "nvim";
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      FZF_DEFAULT_OPTS = ''
        --color=fg:#908caa,bg:#000000,hl:#f38ba8
        --color=fg+:#e0def4,bg+:#393552,hl+:#f38ba8
        --color=border:#44415a,header:#3e8fb0,gutter:#000000
        --color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
        --color=pointer:#f5e0dc,marker:#eb6f92,prompt:#908caa
        --layout=reverse
        --border
      '';
    };
    localBinInPath = true;
  };
}
