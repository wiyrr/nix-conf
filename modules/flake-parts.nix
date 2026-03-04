{ inputs, ... }:
{
  imports = [
    inputs.flake-parts.flakeModules.modules
    inputs.disko.flakeModules.default
  ];

  options = {
    flake = inputs.flake-parts.lib.mkSubmoduleOptions {
      wrapperModules = inputs.nixpkgs.lib.mkOption {
        default = { };
      };
    };
  };

  config = {
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];
  };
}
