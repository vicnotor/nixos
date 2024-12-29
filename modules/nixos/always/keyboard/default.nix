{...}: {
  services.xserver.xkb = {
    layout = "us";
    options = "caps:swapescape,compose:ralt";
  };
  console.useXkbConfig = true; # Use xkb keyboard config in tty
}
