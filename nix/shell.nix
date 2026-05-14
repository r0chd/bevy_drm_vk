{ pkgs, rustToolchain }:
pkgs.mkShell (
  pkgs.lib.fix (finalAttrs: {
    name = "bevy-drm-vk-devshell";
    packages = builtins.attrValues {
      inherit
        rustToolchain
        ;
    };

    buildInputs = builtins.attrValues {
      inherit (pkgs)
        pkg-config
        udev
        alsa-lib
        vulkan-tools
        vulkan-headers
        vulkan-loader
        vulkan-validation-layers
        libxcursor
        libxrandr
        libxi
        wayland
        egl-wayland
        libGL
        ;
    };

    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath finalAttrs.buildInputs;
    RUST_SRC_PATH = "${rustToolchain}/lib/rustlib/src/rust/library";
  })
)
