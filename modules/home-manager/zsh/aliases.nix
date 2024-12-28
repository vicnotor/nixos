{
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
  gpom = "git push origin main";
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
  rebuild = "sudo nixos-rebuild switch --flake ~/Git/xxheyhey/nixos-xx#nixlap";
  update = "sudo echo -n && nix flake update --flake ~/Git/xxheyhey/nixos-xx && sudo nixos-rebuild switch --flake ~/Git/xxheyhey/nixos-xx#nixlap";
  clean = "sudo echo -n && nh clean all --keep 10";

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
  valias = "vim $HOME/Git/xxheyhey/nixos-xx/modules/home-manager/zsh/aliases.nix";
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
}
