{
  stdenv,
  lib,
  kernel,
  fetchgit,
}:
stdenv.mkDerivation {
  pname = "btrfsmaintenance";
  version = "${kernel.modDirVersion}";

  src = fetchgit {
    url = "https://github.com/kdave/btrfsmaintenance";
    branchName = "master";
    sha256 = lib.fakeSha256;
  };

  buildPhase = ''
  '';
  installPhase = ''
    mkdir -p $out/share/btrfsmaintenance
    cp btrfs-*.sh $out/share/btrfsmaintenance/

    cp sysconfig.btrfsmaintenance $out/

    # TODO: link $out/sysconfig.btrfsmaintenance to /etc/default/btrfsmaintenance or /etc/sysconfig/btrfsmaintenance
  '';

  meta = {
    description = "Scripts for btrfs maintenance tasks like periodic scrub, balance, trim or defrag on selected mountpoints or directories. ";
    homepage = "https://github.com/kdave/btrfsmaintenance";
    maintainers = ["kdave"];
    platforms = lib.platforms.linux;
  };
}
