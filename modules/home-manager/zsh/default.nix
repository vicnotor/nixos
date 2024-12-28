{
  lib,
  config,
  ...
}: {
  options = {
    zshModule.enable =
      lib.mkEnableOption "enables zsh module";
  };

  config = lib.mkIf config.zshModule.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      dotDir = ".config/zsh";
      initExtra = ''
        # Keybindings
        bindkey -s ^f "tmux-sessionizer\n"
        bindkey -s ^t "tmux attach\n"
        bindkey -s ^g "open-current-dir\n"
        bindkey -s ● "tmux-home\n"

        # Fixes slow git autocompletion
        __git_files () {
          _wanted files expl 'local files' _files
        }

        # Keep history of `cd` as in with `pushd` and make `cd -<TAB>` work.
        DIRSTACKSIZE=16
        setopt auto_pushd
        setopt pushd_ignore_dups
        setopt pushd_minus

        # Nobody need flow control anymore.
        setopt noflowcontrol

        cd . # tmux-sessionizer fix that fixes the current dir not showing in the prompt
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "direnv"
        ];
        theme = "robbyrussell";
      };
      profileExtra = ''
        if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] && uwsm check may-start; then
          exec uwsm start -S hyprland-uwsm.desktop
        fi
        if [ -z $DISPLAY ] && [ $(tty) = /dev/tty2 ]; then
          exec Hyprland
        fi
      '';
      sessionVariables = {
        DIRSTACKSIZE = 16;
        HYPHEN_INSENSITIVE = "true";
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
      shellAliases = {
        # Vim
        vim = "nvim";
        vi = "vim";
        v = "vim";
        im = "nvim";
        svim = "sudo nvim";
        svi = "svim";
        sv = "svim";
        gvim = "nvim --listen ~/.cache/nvim/godot.pipe .";

        # Git
        g = "git";
        gs = "git status";
        gP = "git push";
        gpo = "git push origin";
        gpom = "git push origin master";
        gpuom = "git push -u origin master";
        gp = "git pull --rebase";
        ga = "git add";
        gaa = "git add --all";
        gc = "git commit --verbose";
        glo = "git log --pretty=oneline";

        # ls
        ls = "ls -l --color=tty --group-directories-first --human-readable";
        ll = "ls -alF";
        la = "ls -A";
        l = "ls -CF";

        # Tmux
        t = "tmux";
        ta = "tmux attach";
        tl = "tmux ls";
        tls = "tmux ls";
        tk = "tmux kill-server";
        ts = "tmux-sessionizer";
        th = "tmux-home";

        # Syncing
        syncy = "onedrive --sync";
        syncoff = "onedrive --sync && poweroff";
        syncreboot = "onedrive --sync && reboot";

        # NixOS
        oldrebuild = "sudo nixos-rebuild switch --flake ~/Git/xxheyhey/nixos-xx#nixlap";
        rebuild = "sudo echo -n && nh os switch";
        update = "sudo echo -n && nh os switch --update";
        clean = "sudo echo -n && nh clean all --keep 5";

        # Pandoc
        mdtopdf = "pandoc --from=markdown --to=pdf -o pdf.pdf";
        mdtohtml = "pandoc --from=markdown --to=html -o html.html";

        # Markdown
        md = "glow";

        # Nice ones
        ":q" = "exit";
        ":Q" = "exit";
        off = "poweroff";
        browser = "uwsm app -- google-chrome";
        ff = "fastfetch";
        nf = "fastfetch";
        goto = "source";
        chx = "chmod +x";
        open = "xdg-open";
        py = "python";
        valias = "vim $HOME/Git/xxheyhey/nixos-xx/modules/home-manager/zsh/default.nix";
        view = "qimgv";
        wp = "swww img";
        ev = "silent evince";
        thu = "silent thunar .";
        cabalclean = "rm -r dist-newstyle";
        R = "R --no-save --quiet";
        pf = "fd --type f | fzf | xargs nvim";
        direnvnix = "echo 'use nix' >> .envrc && direnv allow";
        direnvflake = "echo 'use flake' >> .envrc && direnv allow";
      };
    };
  };
}
