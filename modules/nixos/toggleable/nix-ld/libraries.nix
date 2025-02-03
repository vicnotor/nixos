{pkgs}:
with pkgs; [
  icu # Needed for marksman

  # For Computational Biology course (should move into shell)
  libpng
  zlib
  xorg.libX11
]
