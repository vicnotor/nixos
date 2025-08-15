{...}: {
  services.xserver.xkb = {
    layout = "us";
    options = "compose:ralt";
  };
  console.useXkbConfig = true; # Use xkb keyboard config in tty
}
