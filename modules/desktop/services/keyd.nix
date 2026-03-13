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
            taptime = 150;
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
              katakanahiragana = "backspace";
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
                  s = "lettermod(alt, n, ${toString holdtime}, ${toString taptime})";
                  d = "lettermod(control, t, ${toString holdtime}, ${toString taptime})";
                  f = "overloadt(sym, h, ${toString holdtime}, ${toString taptime})";
                  j = "overloadt(sym, a, ${toString holdtime}, ${toString taptime})";
                  k = "lettermod(control, e, ${toString holdtime}, ${toString taptime})";
                  l = "lettermod(alt, i, ${toString holdtime}, ${toString taptime})";

                  # Lt
                  leftalt = "overloadt(meta, esc, ${toString taptime})";
                  muhenkan = "overloadt(nav, r, ${toString taptime})";
                  space = "lettermodt(shift, space, ${toString taptime})";
                  henkan = "overloadt(num, enter, ${toString taptime})";

                  # Chords
                  "w+e" = "q";
                  "e+r" = "z";
                  "d+f" = "esc";

                  "x+c" = "C-insert"; # copy
                  "x+v" = "C-x"; # cut
                  "c+v" = "S-insert"; # paste

                  # Unbind
                  esc = "noop";
                  backspace = "noop";
                  capslock = "noop";
                };

                "nav" = {
                  f = "C-pageup";
                  r = "C-pagedown";
                  s = "leftalt";
                  d = "leftcontrol";

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
                };

                "sym" = {
                  q = "S-`"; # `
                  w = "S-0"; # )
                  e = "S-]"; # }
                  r = "]"; # ]
                  t = "S-2"; # @
                  y = "S-:"; # :
                  u = "S-1"; # !
                  i = "S-8"; # *
                  o = "S-7"; # &

                  # TODO: ``` macro
                  # p = ""; # ```

                  a = "S-`"; # ~
                  s = "S-9"; # (
                  d = "S-["; # {
                  f = "["; # [
                  g = "backslash"; # \
                  h = "S-,"; # <
                  j = "S-6"; # ^
                  k = "S-3"; # #
                  l = "S-5"; # %
                  ";" = "S-4"; # $
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
