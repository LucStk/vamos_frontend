

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
          platformVersions = [ "35" "36" ];
          buildToolsVersions = [ "28.0.3" "35.0.0" "36.0.0" ];

          includeNDK = true;
          ndkVersion = "28.2.13676358";

          # Le plugin jni exige cette version (Gradle ne peut pas l'installer
          # dans /nix/store, en lecture seule).
          cmakeVersions = [ "3.22.1" ];

          includeEmulator = false;
        };

        # Ports du PC que l'app atteint depuis le téléphone (via adb reverse) :
        # 8000 = Django, 8333 = stockage S3 (images, uploads présignés).
        reversePorts = [ "8000" "8333" ];

        # `run-phone [args flutter run]` : redirige les ports vers chaque
        # téléphone branché en USB, puis lance l'app dessus.
        runPhone = pkgs.writeShellScriptBin "run-phone" ''
          set -euo pipefail
          adb="${androidSdk.androidsdk}/libexec/android-sdk/platform-tools/adb"

          "$adb" wait-for-device
          for serial in $("$adb" devices | ${pkgs.gawk}/bin/awk 'NR>1 && $2=="device" {print $1}'); do
            for port in ${pkgs.lib.concatStringsSep " " reversePorts}; do
              "$adb" -s "$serial" reverse "tcp:$port" "tcp:$port" >/dev/null
            done
            echo "adb reverse ${pkgs.lib.concatStringsSep ", " reversePorts} -> $serial"
          done

          cd "$(${pkgs.git}/bin/git rev-parse --show-toplevel)/apps/vamos_cartographie"
          exec flutter run "$@"
        '';

        # `run-preview [args flutter run]` : app Linux avec aperçu smartphone.
        # Forcée en X11 (XWayland) : sous Wayland, Flutter 3.50 n'affiche pas
        # la fenêtre de main_preview.dart (« Timed out waiting for subsurface
        # frame »).
        runPreview = pkgs.writeShellScriptBin "run-preview" ''
          set -euo pipefail
          cd "$(${pkgs.git}/bin/git rev-parse --show-toplevel)/apps/vamos_cartographie"
          GDK_BACKEND=x11 exec flutter run -d linux -t lib/main_preview.dart "$@"
        '';

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
            jdk17
            runPhone
            runPreview
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
