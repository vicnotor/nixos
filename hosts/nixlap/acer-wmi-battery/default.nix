{
  stdenv,
  lib,
  kernel,
  fetchgit,
}:
stdenv.mkDerivation {
  pname = "acer-wmi-battery";
  version = "${kernel.modDirVersion}";

  src = fetchgit {
    url = "https://github.com/vicnotor/acer-wmi-battery"; # NOTE: currently using vicnotor's fork until PR merge
    branchName = "main";
    sha256 = "sha256-XwcJFBT3KPAkfj8nZX1G0fHwjv2Od7DYh3MD1DICxf4=";
  };

  hardeningDisable = ["pic" "format"];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}"
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "INSTALL_MOD_PATH=$(out)"
  ];

  meta = {
    description = "A kernel module for setting Acer device battery settings";
    homepage = "https://github.com/frederik-h/acer-wmi-battery";
    license = lib.licenses.gpl2;
    maintainers = ["Frederik Harwath"];
    platforms = lib.platforms.linux;
  };
  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}
    cp -r *.ko $out/lib/modules/${kernel.modDirVersion}/
  '';
}
