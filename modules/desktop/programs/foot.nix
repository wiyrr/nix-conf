{ inputs, lib, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.foot =
        (inputs.wrappers.wrapperModules.foot.apply {
          inherit pkgs;
          settings = {
            bell = {
              notify = true;
              urgent = true;
            };

            colors-dark = {
              alpha = 0.5;

              # Catppuccin Mocha
              cursor = "11111b f5e0dc";
              foreground = "cdd6f4";
              background = "1e1e2e";

              regular0 = "45475a";
              regular1 = "f38ba8";
              regular2 = "a6e3a1";
              regular3 = "f9e2af";
              regular4 = "89b4fa";
              regular5 = "f5c2e7";
              regular6 = "94e2d5";
              regular7 = "bac2de";

              bright0 = "585b70";
              bright1 = "f38ba8";
              bright2 = "a6e3a1";
              bright3 = "f9e2af";
              bright4 = "89b4fa";
              bright5 = "f5c2e7";
              bright6 = "94e2d5";
              bright7 = "a6adc8";

              "16" = "fab387";
              "17" = "f5e0dc";

              selection-foreground = "cdd6f4";
              selection-background = "414356";

              search-box-no-match = "11111b f38ba8";
              search-box-match = "cdd6f4 313244";
              jump-labels = "11111b fab387";
              urls = "89b4fa";
            };

            cursor = {
              style = "beam";
              beam-thickness = 1;
            };

            desktop-notifications = {
              command = "${lib.getExe pkgs.libnotify} -a \${app-id} -i \${app-id} \${title} \${body}";
            };

            main = {
              dpi-aware = false;
              font = "IosevkaTerm NF:size=15";
              horizontal-letter-offset = 0;
              vertical-letter-offset = 0;
              pad = "8x0 center";
              selection-target = "clipboard";
            };

            mouse = {
              hide-when-typing = true;
            };

            scrollback = {
              lines = 10000;
              multiplier = 3;
              indicator-position = "relative";
              indicator-format = "line";
            };

            tweak = {
              box-drawing-base-thickness = 0.06;
            };

            url = {
              launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
            };

            key-bindings = {
              scrollback-down-half-page = "Control+Shift+d";
              scrollback-down-page = "Shift+Page_Down";
              scrollback-end = "Shift+End";
              scrollback-home = "Shift+Home";
              scrollback-up-half-page = "Control+Shift+u";
              scrollback-up-page = "Shift+Page_Up";
              search-start = "Control+slash";
              show-urls-launch = "Control+Shift+h";
              unicode-input = "none";

              primary-paste = "none";
              clipboard-paste = "Control+Shift+v XF86Paste Shift+Insert";
            };
          };
        }).wrapper;
    };
}
