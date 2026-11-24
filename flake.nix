

{
  description = "Environnement de développement Flutter pour Vamos Cartographie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
          };
        };

        flutterFixed = pkgs.flutter.overrideAttrs (old: {
          postInstall = (old.postInstall or "") + ''
            find $out/bin/cache/artifacts/engine \
              -type f \( -name "flutter_tester" -o -name "*.so" \) \
              -exec chmod +x {} \; 2>/dev/null || true
          '';
        });

        # Android SDK
        androidSdk = pkgs.androidenv.composeAndroidPackages {
          platformVersions = [ "35" ];
          buildToolsVersions = [ "35.0.0" ];
          includeNDK = false;
          includeEmulator = false;
        };

        runtimeLibs = with pkgs; [
          gtk3 glib libunwind orc libepoxy gsettings-desktop-schemas
          at-spi2-atk pango cairo harfbuzz fontconfig libGL
          dbus libX11 libXext libXrender libXinerama libXi libXcursor
          libXdamage libXfixes libXtst libxcb
          gdal geos proj libspatialite zlib
        ];

      in {
        devShells.default = pkgs.mkShell.override {
          stdenv = pkgs.clangStdenv;
        } {
          name = "flutter-env";

          nativeBuildInputs = with pkgs; [
            cmake
            ninja
            pkg-config
            nixd
            alejandra
            flutterFixed
            melos
            tree

            # Android development
            android-tools
            jdk17
            androidSdk.androidsdk
          ];

          buildInputs = runtimeLibs;

          shellHook = ''
            unset LD_LIBRARY_PATH

            export NO_AT_BRIDGE=1
            export XCURSOR_PATH="${pkgs.adwaita-icon-theme}/share/icons"
            export PKG_CONFIG_PATH="${pkgs.lib.makeSearchPath "lib/pkgconfig" runtimeLibs}"
            export PATH="$HOME/.pub-cache/bin:$PATH"

            # Android SDK
            export ANDROID_HOME="${androidSdk.androidsdk}/libexec/android-sdk"
            export ANDROID_SDK_ROOT="$ANDROID_HOME"
            export JAVA_HOME="${pkgs.jdk17}"

            # GSettings
            export XDG_DATA_DIRS="${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS"
          '';
        };
      }
    );
}
