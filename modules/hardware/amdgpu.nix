{
  flake.modules.nixos.amdgpu =
    { pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "amdgpu" ];

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          libvdpau-va-gl # VA-API to VDPAU wrapper
          libva-vdpau-driver # VDPAU to VA-API wrapper
        ];
        extraPackages32 = with pkgs.driversi686Linux; [
          mesa
        ];
      };

      environment.systemPackages = with pkgs; [
        vulkan-tools
        vulkan-validation-layers
        nvtopPackages.amd
        # amdgpu_top
      ];

      hardware.amdgpu = {
        initrd.enable = true; # Can fix lower resolution in boot screen during initramfs phase
      };

      # environment.variables = {
      #   VDPAU_DRIVER = "radeonsi";
      # };
    };
}
