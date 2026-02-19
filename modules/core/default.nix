{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.globals) userName;
  inherit (lib) mkDefault;
in
{
  environment.systemPackages = with pkgs; [
    curl
    file # print filetype
    git
    killall
    neovim
    p7zip
    wget # download http/ftp
  ];

  programs' = {
    bat.enable = mkDefault true;
    btop.enable = mkDefault true;
    eza.enable = mkDefault true;
    fastfetch.enable = mkDefault true;
    fish.enable = mkDefault true;
    fish.isDefault = mkDefault true;
    fzf.enable = mkDefault true;
    git.enable = mkDefault true;
    gtrash.enable = mkDefault true;
    lazygit.enable = mkDefault true;
    nvim.enable = mkDefault true;
    ripgrep.enable = mkDefault true;
    starship.enable = mkDefault true;
    tmux.enable = mkDefault true;
    yazi.enable = mkDefault true;
    zoxide.enable = mkDefault true;
  };

  globals =
    let
      userName = "tsubaki";
      hmConfig = config.home-manager.users.${userName};
      configDirectory = "${hmConfig.home.homeDirectory}/dots";
    in
    {
      userName = mkDefault userName;
      homeDirectory = mkDefault "/home/${userName}";
      configDirectory = mkDefault configDirectory;
    };

  zramSwap.enable = mkDefault true;
  time.timeZone = mkDefault "Asia/Tokyo";
  system.stateVersion = mkDefault "25.05";
  home-manager.users.${userName}.home.stateVersion = mkDefault "25.05";
}
