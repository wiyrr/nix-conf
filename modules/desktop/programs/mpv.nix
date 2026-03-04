{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.mpv =
        (inputs.wrappers.wrapperModules.mpv.apply {
          inherit pkgs;
          scripts =
            with pkgs.mpvScripts;
            [
              # cutter
              mpris
              # mpv-cheatsheet
              # quality-menu
              # thumbfast
              # thumbnail
              # uosc
            ]
            ++ (with pkgs.mpvScripts.builtins; [
              autoload
            ]);

          "mpv.conf".content = ''
            osc=no
            border=no
            keep-open=yes
            pause=true
            video-sync=display-resample

            hwdec=auto-safe
            vo=gpu
            gpu-hwdec-interop=vaapi
            tone-mapping=auto
            gpu-api=vulkan
          '';
        }).wrapper;
    };
}
