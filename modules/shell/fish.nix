{
  flake.modules.nixos.shell =
    { config, pkgs, ... }:
    {
      programs = {
        fish = {
          enable = true;
          shellInit = /* fish */ ''
              set fish_greeting

              # use vi key bindings with hybrid emacs keybindings
              function fish_user_key_bindings
                  fish_default_key_bindings -M insert
                  fish_vi_key_bindings --no-erase insert
              end

              # setup vi mode
              fish_vi_key_bindings

              # setup fish-completion-sync
            #
          '';
          shellAbbrs = {
            k = "killall";
            kn = "killall -9";
            xx = "7z";
            yt = "yt-dlp";
            sc = "scdl";
            dr = "tldr";
            chx = "chmod +x";

            us = "systemctl --user";
            ds = "sudo systemctl";

            btc = "bluetoothctl connect";
            btd = "bluetoothctl disconnect";
            vol = "wpctl set-volume '@DEFAULT_AUDIO_SINK@'";

            jp = "LANG=ja_JP.UTF-8 LC_ALL=ja_JP.UTF-8";
            jis = "recode shift_jis..utf8";
            utf16 = "recode utf16..utf8";

            t = "tmux";
            ts = "tmux new-session -s";
            tl = "tmux list-sessions";
            ta = "tmux attach";
            tat = "tmux attach -t";
            tad = "tmux attach -d -t";
            tkss = "tmux kill-session -t";
            tksv = "tmux kill-server";

            nf = "nix flake";
            nfc = "nix flake check";
            nfu = "nix flake update";
            npr = "nixpkgs-review pr --run fish --print-result";
            nd = "nix develop --command fish";
            nb = "nix build";
            ns = "nix shell";
            nr = "nix run";
            ncg = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
            nvd = "nvd --color always diff /run/current-system result | rg -v 0.0.0 | less -R";
            sw = "nh os switch --ask /home/tsubaki/dots";

            g = "git";
            ga = "git add";
            gaa = "git add --all";
            gap = "git add --patch";
            gapp = "git apply";
            gb = "git branch --verbose";
            gbr = "git branch --verbose --remotes";
            gbd = "git branch --delete";
            gbD = "git branch --delete --force";
            gc = "git commit -m";
            gca = "git commit --amend";
            gcl = "git clone";
            gco = "git checkout";
            gcot = "git checkout --theirs";
            gcp = "git cherry-pick --strategy-option theirs";
            gcpx = "git cherry-pick --strategy-option theirs -x";
            gd = "git diff";
            gds = "git diff --staged";
            gf = "git fetch";
            gi = "git init";
            gl = "git log --oneline --decorate --graph -n 10";
            gm = "git merge";
            gp = "git pull";
            gP = "git push";
            gr = "git reset HEAD~";
            gR = "git restore";
            gRs = "git restore --staged";
            gra = "git remote add";
            gre = "git remote --verbose";
            grh = "git reset HEAD";
            grr = "git reset --hard HEAD~";
            grb = "git rebase --interactive";
            grbc = "git rebase --continue";
            gs = "git status";
            gsma = "git submodule add";
            gsmu = "git submodule update --init --remote --recursive";
            gst = "git stash";
            gstp = "git stash pop";
            gsw = "git switch";
            gt = "git tag";
            gts = "git tag -s";

            lg = "lazygit";
          };
        };
      };

      # fish plugins
      environment = {
        # install fish completions for fish
        # https://github.com/nix-community/home-manager/pull/2408
        pathsToLink = [ "/share/fish" ];

        systemPackages = with pkgs.fishPlugins; [
          sponge
          # autopair
          # done
        ];
      };
    };
}
