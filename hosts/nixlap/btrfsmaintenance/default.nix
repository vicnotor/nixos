{
  stdenv,
  lib,
  fetchgit,
}:
stdenv.mkDerivation {
  pname = "btrfsmaintenance";
  version = "0.1.0";

  src = fetchgit {
    url = "https://github.com/kdave/btrfsmaintenance";
    branchName = "master";
    sha256 = "sha256-PHrgy0vqUvKhWu0bgl1WpIPu95wOXDeibSqL+yuy00E=";
  };

  installPhase = ''
    mkdir -p $out/share/btrfsmaintenance
    cp btrfs-*.sh $out/share/btrfsmaintenance/

    mkdir -p $out/lib/systemd/system

    cp btrfs-*.service $out/lib/systemd/system/
    cp btrfs-*.timer $out/lib/systemd/system/

    mkdir -p $out/etc
    cp sysconfig.btrfsmaintenance $out/etc/
  '';

  meta = {
    description = "Scripts for btrfs maintenance tasks like periodic scrub, balance, trim or defrag on selected mountpoints or directories. ";
    homepage = "https://github.com/kdave/btrfsmaintenance";
    maintainers = ["kdave"];
    platforms = lib.platforms.linux;
  };
}
