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
          config.allowUnfree = true;
        };

        # On garde ton patch pour flutter_tester
        flutterFixed = pkgs.flutter.overrideAttrs (old: {
          postInstall = (old.postInstall or "") + ''
            find $out/bin/cache/artifacts/engine -type f \( -name "flutter_tester" -o -name "*.so" \) \
              -exec chmod +x {} \; 2>/dev/null || true
          '';
        });

        # Liste des bibliothèques nécessaires pour Flutter et la Géo
        runtimeLibs = with pkgs; [
          melos
          # UI & GTK
          gtk3
          glib
          libunwind
          orc
          tree
          libepoxy
          gsettings-desktop-schemas
          at-spi2-atk
          pango
          cairo
          harfbuzz
          fontconfig
          libGL
          # X11
          dbus
          libX11
          libXext
          libXrender
          libXinerama
          libXi
          libXcursor
          libXdamage
          libXfixes
          libXtst
          libxcb
          # Géo & Systèmes
          gdal
          geos
          proj
          libspatialite
          zlib
        ];

      in
      {
        devShells.default = pkgs.mkShell {
          name = "flutter-env";

          nativeBuildInputs = with pkgs; [
            flutterFixed
            cmake
            ninja
            pkg-config
            nixd
            alejandra
          ];

          buildInputs = runtimeLibs;

          shellHook = ''
            export PKG_CONFIG_PATH="${pkgs.lib.makeSearchPath "lib/pkgconfig" runtimeLibs}"
            export PATH="$HOME/.pub-cache/bin:$PATH"
          '';
        };
      }
    );
}
