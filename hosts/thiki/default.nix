{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  userName = "tsubaki";
  hmConfig = config.home-manager.users.${userName};
  configDirectory = "${hmConfig.home.homeDirectory}/dots";
in
{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-p14s-amd-gen4
    ./disko.nix
    ./hardware.nix
  ];
  config = {
    hardware'.amdgpu.enable = true;
    # hardware'.bluetooth.enable = true;
    networking'.iwd.enable = true;
    networking'.mullvad.enable = true;
    security'.doas.enable = true;
    security'.polkit.enable = true;

    programs' = {
      bat.enable = true;
      btop.enable = true;
      eza.enable = true;
      fish.enable = true;
      fish.isDefault = true;
      fzf.enable = true;
      git.enable = true;
      lazygit.enable = true;
      nvim.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      tmux.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
    };

    ## DESKTOP
    programs'.dwl.isDefault = true; # dwl, hyprland, niri

    programs'.dwl.enable = true;
    programs'.hyprland.enable = true;
    programs'.noctalia-shell.enable = true;

    desktop = {
      fonts.enable = true;
      gtk.enable = true;
      uwsm.enable = true;
      wayland.enable = true;
    };

    ## default programs
    programs'.foot.isDefault = true; # foot, ghostty, kitty
    programs'.librewolf.isDefault = true; # firefox, librewolf, zen-browser
    # programs'.tofi.isDefault = true;

    programs' = {
      foot.enable = true;
      # tofi.enable = true;
      # librewolf.enable = true;
      # mpv.enable = true;
    };

    services' = {
      keyd.enable = true;
      # mako.enable = true;
      pipewire.enable = true;
    };

    globals = {
      userName = userName;
      homeDirectory = "/home/${userName}";
      configDirectory = configDirectory;
    };

    # laptop-specific config
    services.power-profiles-daemon.enable = true;
    environment.systemPackages = with pkgs; [
      alsa-utils
      librewolf
      brightnessctl
    ];

    stylix = {
      opacity = {
        terminal = lib.mkForce 1.0;
        popups = lib.mkForce 1.0;
      };
      font.sizes =
        let
          fontSize = 12;
        in
        {
          applications = lib.mkForce fontSize;
          desktop = lib.mkForce fontSize;
          popups = lib.mkForce fontSize;
          terminal = lib.mkForce fontSize;
        };
    };

    console = {
      earlySetup = true;
      font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
      packages = with pkgs; [ terminus_font ];
    };

    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        timeout = 0;
      };
      kernelParams = [ ];
      blacklistedKernelModules = [ "uvcvideo" ];
    };
  };
}
