{ self, ... }:
{
  flake.modules.nixos.shell =
    { pkgs, ... }:
    let
      selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
    in
    {
      environment = {
        systemPackages = with pkgs; [
          nil
          nixd
          statix
          nixfmt

          # other
          btop
          eza
          fd
          ffmpeg
          git
          file
          tealdeer
          htop
          imagemagick
          killall
          p7zip
          ripgrep
          sshfs
          tldr
          unzip
          wget
          yt-dlp
          zip

          # Edidor
          neovim
          bash-language-server
          # cargo
          # clang-tools
          # gcc
          # gnumake
          lua-language-server
          markdown-oxide
          markdownlint-cli2
          marksman
          # rust-analyzer
          # rustc
          # rustfmt
          shfmt
          statix
          stylua
          # tailwindcss
          # tailwindcss-language-server
          tree-sitter

          # Wrapped Programs
          selfpkgs.bat
          selfpkgs.fzf
          # selfpkgs.git
          selfpkgs.lazygit
          selfpkgs.nh
          selfpkgs.tmux
          selfpkgs.starship
        ];

        shellAliases = {
          v = "nvim";
        };

        variables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };
      };
    };
}
