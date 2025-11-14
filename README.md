# My NixOS config

\<3 nix

# Imperative steps for setup

Every non-declarative part of this sytem setup is listed in
[IMPERATIVE.md](./IMPERATIVE.md)

# Install

Format any extra disks that will be a part of the BTRFS filesystem (make
sure to add these devices to the btrfs arguments in disk-config.nix):

```bash
sudo mkfs.btrfs -f /dev/disk/by-id/<device-id>
```

Partitioning with
[disko](https://github.com/nix-community/disko/blob/master/docs/quickstart.md):

```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /path/to/disk-config.nix
```

Installation (limiting max-jobs and number of cores to prevent memory
overflow):

```bash
sudo nixos-install --no-root-passwd --max-jobs 2 --cores 2 --flake /path/to/flake#hostname
```

Set password:

```bash
sudo nixos-enter --root /mnt -c 'passwd <username>'
```

Reboot:

```bash
reboot
```
