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

          # Outils disponibles dans le PATH
          nativeBuildInputs = with pkgs; [
            flutterFixed
            dart
            pkg-config
            # LSPs pour Zed
            nixd
            alejandra # Formateur de code Nix
          ];

          # Bibliothèques disponibles pour le linker et les dépendances
          buildInputs = runtimeLibs;

          # Variables d'environnement injectées par direnv
          shellHook = ''
            # Force CMake à utiliser le pkg-config de Nix au lieu de /usr/bin
            export PKG_CONFIG_EXECUTABLE="${pkgs.pkg-config}/bin/pkg-config"
            export PATH="$HOME/.pub-cache/bin:$PATH"
            # Aide CMake à trouver les bibliothèques GTK et autres via pkg-config
            export PKG_CONFIG_PATH="${pkgs.lib.makeSearchPath "lib/pkgconfig" runtimeLibs}"

            # --- Tes autres exports (Géo, LD_LIBRARY_PATH, etc.) ---
            export GDAL_LIBRARY_PATH="${pkgs.gdal}/lib/libgdal.so"
            # ... garde le reste de ton shellHook actuel ...
            # --- Géo ---
            export GDAL_LIBRARY_PATH="${pkgs.gdal}/lib/libgdal.so"
            export GEOS_LIBRARY_PATH="${pkgs.geos}/lib/libgeos_c.so"
            export SPATIALITE_LIBRARY_PATH="${pkgs.libspatialite}/lib/mod_spatialite.so"

            # --- FIX GSettings / Crash Image Picker ---
            export XDG_DATA_DIRS="${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS"

            # --- LD_LIBRARY_PATH (Crucial pour Flutter hors FHS) ---
            # Cela permet aux binaires de trouver les .so sans FHS
            export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath runtimeLibs}:$LD_LIBRARY_PATH"

            # --- Fontconfig ---
            export XDG_CACHE_HOME="$HOME/.cache"
            export FONTCONFIG_FILE=${pkgs.makeFontsConf { fontDirectories = [ pkgs.freefont_ttf ]; }}

            # --- Patch manuel flutter_tester ---
            _FT_SRC="${flutterFixed}/bin/cache/artifacts/engine/linux-x64/flutter_tester"
            _FT_DST="$HOME/.cache/flutter-engine/linux-x64/flutter_tester"
            if [ -f "$_FT_SRC" ] && [ ! -x "$_FT_DST" ]; then
              mkdir -p "$(dirname "$_FT_DST")"
              cp "$_FT_SRC" "$_FT_DST"
              chmod +x "$_FT_DST"
              echo "✅ flutter_tester synchronisé dans le cache."
            fi

            echo "🚀 Environnement Flutter (mkShell) chargé avec direnv."
          '';
        };
      }
    );
}
