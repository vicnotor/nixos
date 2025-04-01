{
  # Vim
  vim = "nvim";
  vi = "vim";
  v = "vim";
  im = "vim";
  svim = "sudo nvim";
  svi = "svim";
  sv = "svim";
  gvim = "vim --listen ~/.cache/nvim/godot.pipe .";
  "v." = "vim .";

  # Git
  g = "git";
  gs = "git status";
  gP = "git push";
  gpo = "git push origin";
  gpom = "git push origin main";
  gpoM = "git push origin master";
  gpuom = "git push -u origin main";
  gp = "git pull --rebase";
  ga = "git add";
  gaa = "git add --all";
  gc = "git commit --verbose";
  glo = "git log --pretty=oneline";

  # ls
  ls = "ls -l --color=tty --group-directories-first --human-readable";
  ll = "ls -alF";
  la = "ls -A";
  l = "ls";

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
  rebuild = "sudo nixos-rebuild switch --flake ~/Git/vicnotor/nixos#nixlap";
  update = "nix flake update --flake ~/Git/vicnotor/nixos && sudo nixos-rebuild switch --flake ~/Git/vicnotor/nixos#nixlap";
  clean = "sudo echo -n && nh clean all --keep 10";
  optimise = "sudo echo -n && sudo nix-store --optimise --verbose"; # If both garbage collecting and optimising, run this after garbage collecting

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
  valias = "vim $HOME/Git/vicnotor/nixos/modules/home-manager/toggleable/zsh/aliases.nix";
  view = "qimgv";
  wp = "swww img";
  ev = "silent evince";
  thu = "silent thunar .";
  cabalclean = "rm -r dist-newstyle";
  R = "R --no-save --quiet";
  pf = "fd --type f | fzf | xargs nvim";
  direnvnix = "echo 'use nix' >> .envrc && direnv allow";
  direnvflake = "echo 'use flake' >> .envrc && direnv allow";
  cp = "cp -v";
  mv = "mv -v";
  godot = "godot4 --display-driver wayland";
  batterystatus = "acpi";
  vpak = "vim $HOME/Git/vicnotor/nixos/modules/home-manager/always/packages/default.nix";
  vrpak = "vim $HOME/Git/vicnotor/nixos/modules/home-manager/toggleable/r/default.nix";
  vospak = "vim $HOME/Git/vicnotor/nixos/modules/nixos/always/packages/default.nix";
  vlib = "vim $HOME/Git/vicnotor/nixos/modules/nixos/toggleable/nix-ld/libraries.nix";
  wifion = "nmcli radio wifi on";
  wifioff = "nmcli radio wifi off";
}
