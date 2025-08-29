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
    url = "https://github.com/frederik-h/acer-wmi-battery";
    branchName = "main";
    sha256 = "sha256-mI6Ob9BmNfwqT3nndWf3jkz8f7tV10odkTnfApsNo+A=";
  };

  hardeningDisable = ["pic" "format"];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  buildPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build \
         M=$(pwd) \
         modules
  '';
  cleanPhase = ''
    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build \
         M=$(pwd) \
         clean
  '';
  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}
    cp -r *.ko $out/lib/modules/${kernel.modDirVersion}/
  '';

  meta = {
    description = "A kernel module for setting Acer device battery settings";
    homepage = "https://github.com/frederik-h/acer-wmi-battery";
    license = lib.licenses.gpl2;
    maintainers = ["Frederik Harwath"];
    platforms = lib.platforms.linux;
  };
}
