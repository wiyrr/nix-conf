{ pkgs, ... }:
{
  imports = [
    ./disko.nix
    ./hardware.nix
  ];
  config = {
    hardware'.amdgpu.enable = true;
    hardware'.bluetooth.enable = true;
    networking'.mullvad.enable = true;
    security'.doas.enable = true;

    ## DESKTOP
    programs'.mango.isDefault = true; # dwl, mango, hyprland, sway
    programs'.kitty.isDefault = true; # foot, kitty
    programs'.librewolf.isDefault = true; # firefox, librewolf, zen-browser

    # programs'.dwl.enable = true;
    programs'.hyprland.enable = true;
    programs'.mango.enable = true;
    # programs'.sway.enable = true;

    programs'.noctalia-shell.enable = true;

    desktop = {
      fonts.enable = true;
      gtk.enable = true;
      uwsm.enable = true;
      wayland.enable = true;
    };

    programs' = {
      cava.enable = true;
      goldendict.enable = true;
      mpv.enable = true;
      pqiv.enable = true;
      spotify.enable = true;
      thunar.enable = true;
      tray-tui.enable = true;
      zathura.enable = true;

      # foot.enable = true;
      kitty.enable = true;

      # firefox.enable = true;
      helium-browser.enable = true;
      # librewolf.enable = true;
      # mullvad-browser.enable = true;
      # qutebrowser.enable = true;
      # zen-browser.enable = true;

      extraPackages.enable = true;
    };

    services' = {
      fcitx.enable = true;
      keyd.enable = true;
      hypridle.enable = true;
      pipewire.enable = true;
      stash.enable = true;
    };

    gaming' = {
      gamemode.enable = true;
      lutris.enable = true;
      mangohud.enable = true;
      steam.enable = true;
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
      kernelPackages = pkgs.linuxPackages_zen;
      kernelParams = [
        "video=DP-2:2560x1440@144"
      ];
    };
  };
}
