{ inputs, self, ... }:
{
  # perSystem =
  #   { pkgs, ... }:
  #   {
  #     packages.git = inputs.wrappers.lib.wrapPackage {
  #       inherit pkgs;
  #       package = pkgs.git;
  #       env = rec {
  #         GIT_AUTHOR_NAME = "wiyris";
  #         GIT_AUTHOR_EMAIL = "c8b5805d-928f-4c0b-8fc0-27817abedf44@passmail.com";
  #         GIT_COMMITTER_NAME = GIT_AUTHOR_NAME;
  #         GIT_COMMITTER_EMAIL = GIT_AUTHOR_EMAIL;
  #       };
  #     };
  #   };

  flake.modules.nixos.shell = {
    programs.git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "wiyris";
          email = "c8b5805d-928f-4c0b-8fc0-27817abedf44@passmail.com";
        };
      };
    };
  };
}
