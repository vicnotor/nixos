{
  stdenv,
  lib,
  kernel,
}:
stdenv.mkDerivation {
  pname = "acer-wmi-battery";
  version = "1.0";

  src = ./.;
  hardeningDisable = ["pic" "format"]; # 1
  nativeBuildInputs = kernel.moduleBuildDependencies; # 2

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}" # 3
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" # 4
    "INSTALL_MOD_PATH=$(out)" # 5
  ];

  meta = {
    description = "A kernel module for setting Acer device battery settings";
    homepage = "https://github.com/frederik-h/acer-wmi-battery";
    license = lib.licenses.gpl2;
    maintainers = ["Frederik Harwath"];
    platforms = lib.platforms.linux;
  };
}
