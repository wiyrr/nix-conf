{
  flake.modules.nixos.keyd =
    { lib, pkgs, ... }:
    {
      systemd.services.keyd = {
        # wantedBy = lib.mkForce "";
        serviceConfig.Restart = lib.mkForce "on-failure"; # prevent restart on backspace+escape+enter
      };

      environment.systemPackages = [ pkgs.keyd ];

      services.keyd = {
        enable = true;
        keyboards =
          let
            holdtime = 200;
            taptime = 175;
            handsDownPromethium = {
              # JIS layout
              q = "f";
              w = "p";
              e = "d";
              r = "l";
              t = "x";
              y = ";";
              u = "u";
              i = "o";
              o = "y";
              p = "b";

              a = "s";
              s = "n";
              d = "t";
              f = "h";
              g = "k";
              h = ",";
              j = "a";
              k = "e";
              l = "i";
              ";" = "c";

              z = "v";
              x = "w";
              c = "g";
              v = "m";
              b = "j";
              n = "-";
              m = ".";
              "," = "'";
              "." = "=";

              muhenkan = "r";
              henkan = "backspace";
              leftalt = "overloadt(meta, esc, ${toString taptime})";
              capslock = "q";
              "'" = "z";
            };
          in
          {
            internal = {
              ids = [
                "0001:0001" # internal keyboard
              ];
              settings = {
                global = {
                  "chord_timeout" = "35";
                  "default_layout" = "mods";
                };
                "mods:layout" = {
                  # Homerow mods
                  a = "lettermod(meta, s, ${toString holdtime}, ${toString taptime})";
                  s = "lettermod(alt, n, ${toString holdtime}, ${toString taptime})";
                  d = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
                  f = "lettermod(shift, h, ${toString holdtime}, ${toString taptime})";
                  j = "lettermod(shift, a, ${toString holdtime}, ${toString taptime})";
                  k = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
                  l = "lettermod(alt, i, ${toString holdtime}, ${toString taptime})";
                  ";" = "lettermod(meta, c, ${toString holdtime}, ${toString taptime})";

                  # Lt
                  leftalt = "overloadt(meta, esc, ${toString taptime})";
                  muhenkan = "overloadt(nav, r, ${toString taptime})";
                  space = "overloadt(num, space, ${toString taptime})";

                  # Chords
                  "w+e" = "q";
                  "e+r" = "z";
                  "u+i" = "S-6"; # ^
                  "i+o" = "S-2"; # @

                  "r+f" = "S-backslash"; # |
                  "e+d" = "backslash"; # \
                  "u+j" = "S-8"; # *
                  "i+k" = "S-7"; # &

                  "s+f" = "C-space"; # toggle fcitx
                  "j+l" = "S-5"; # %

                  "x+c" = "C-insert"; # copy
                  "c+v" = "S-insert"; # paste

                  "muhenkan+s" = "S-9"; # (
                  "muhenkan+d" = "S-["; # {
                  "muhenkan+f" = "[";

                  "muhenkan+j" = "]";
                  "muhenkan+k" = "S-]"; # }
                  "muhenkan+l" = "S-0"; # )

                  "space+j" = "S-1"; # !
                  "space+k" = "S-3"; # #
                  "space+l" = "S-4"; # $

                  # Unbind
                  esc = "noop";
                  backspace = "noop";
                  capslock = "noop";
                };

                "nav" = {
                  w = "C-pageup";
                  r = "C-pagedown";

                  a = "leftmeta";
                  s = "leftalt";
                  d = "leftcontrol";
                  f = "leftshift";

                  j = "left";
                  k = "down";
                  l = "up";
                  ";" = "right";

                  u = "home";
                  i = "pagedown";
                  o = "pageup";
                  p = "end";
                };

                "num" = {
                  k = "down";
                  l = "up";

                  w = "4";
                  e = "5";
                  r = "6";
                  a = "0";
                  s = "1";
                  d = "2";
                  f = "3";
                  x = "7";
                  c = "8";
                  v = "9";
                  muhenkan = "0";
                };

                "main" = handsDownPromethium;
              };
            };
            external = {
              ids = [
                "05af:1023:c3bf50aa" # BFKB113PBK
                "046d:c339:e1f5519e" # Logitech PRO X
              ];
              settings = {
                global = {
                  # "default_layout" = "";
                };
                "default:layout" = {
                  # "backslash" = "toggle(qwerty)";
                };
                "main" = handsDownPromethium;
              };
            };
          };
      };
    };
}
