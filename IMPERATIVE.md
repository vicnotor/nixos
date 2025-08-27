Everything that is imperative for my system setup is listed here:

- Downloading the latest version of GE-Proton with `protonup`
- Installing Battle.net games through Steam
  ([guide](https://frankbaier.medium.com/linux-how-to-play-diablo-ii-resurrected-open-beta-with-steam-proton-ff830523f378))
- Formatting any extra disks (besides the main disk) that will be a part of
  the BTRFS filesystem (make sure to add these devices to the btrfs
  arguments in disk-config.nix):
  `sudo mkfs.btrfs -f /dev/disk/by-id/<device-id>`
