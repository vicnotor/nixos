{
  # Vim
  vim = "nvim";
  vi = "vim";
  svim = "sudo nvim";
  gvim = "vim --listen ~/.cache/nvim/godot.pipe .";

  # ls
  ls = "eza -lh --group-directories-first --icons=auto";
  ll = "ls -a";

  # Git
  g = "git";
  gc = "git commit -m";
  gs = "git status";

  # Tmux
  t = "app2unit -- tmux";

  # Syncing
  odsync = "onedrive --sync";

  # NixOS
  rebuild = "sudo echo -n && nh os switch";
  update = "nix flake update --flake ~/Git/vicnotor/nixos";
  clean = "sudo echo -n && nh clean all --keep 10";
  optimise = "sudo echo -n && sudo nix-store --optimise --verbose"; # If both garbage collecting and optimising, run this after garbage collecting

  # On/off switches
  wifion = "nmcli radio wifi on";
  wifioff = "nmcli radio wifi off";
  ethon = "sudo ifconfig enp2s0 up";
  ethoff = "sudo ifconfig enp2s0 down";
  virshon = "sudo virsh net-start --network default";
  virshoff = "sudo virsh net-destroy --network default";

  # Nice ones
  ":q" = "exit";
  off = "poweroff";
  hibernate = "systemctl hibernate";
  goto = "source";
  open = "xdg-open";
  valias = "vim $HOME/Git/vicnotor/nixos/modules/home-manager/toggleable/zsh/aliases.nix";
  view = "app2unit -- qimgv";
  ev = "silent evince";
  thu = "silent thunar .";
  R = "R --save --quiet";
  pf = "fd --type f | fzf | xargs nvim";
  cp = "cp -v";
  mv = "mv -v";
  godot = "app2unit -- godot4 --display-driver wayland";
  batterystatus = "acpi";
  vpak = "nvim $HOME/Git/vicnotor/nixos/modules/home-manager/always/packages/default.nix";
  vrpak = "nvim $HOME/Git/vicnotor/nixos/modules/home-manager/toggleable/r/default.nix";
  vospak = "nvim $HOME/Git/vicnotor/nixos/modules/nixos/always/packages/default.nix";
  vlib = "nvim $HOME/Git/vicnotor/nixos/modules/nixos/toggleable/nix-ld/libraries.nix";
  screenrec = "wl-screenrec --low-power off --audio";
  screenrec-history = "wl-screenrec --low-power off --audio --history 30 &";
  screenrec-history-get = "killall -USR1 wl-screenrec";
}
