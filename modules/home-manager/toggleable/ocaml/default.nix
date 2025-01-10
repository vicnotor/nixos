{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    ocamlModule.enable =
      lib.mkEnableOption "enables OCaml module";
  };

  config = lib.mkIf config.ocamlModule.enable {
    home.packages = with pkgs; [
      ocaml
      dune_3
      ocamlPackages.findlib
      ocamlPackages.ocaml-lsp
    ];
  };
}
