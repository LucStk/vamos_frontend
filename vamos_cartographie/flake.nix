{
  description = "Environnement de développement Flutter pour Vamos Cartographie";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # On garde ta logique de patch pour flutter_tester si nécessaire
        flutterFixed = pkgs.flutter.overrideAttrs (old: {
          postInstall = (old.postInstall or "") + ''
            find $out/bin/cache/artifacts/engine -type f \( -name "flutter_tester" -o -name "*.so" \) \
              -exec chmod +x {} \; 2>/dev/null || true
          '';
        });

        # Les schémas dont GTK a besoin pour ne pas crash
        gsettingsSchemas = [
          pkgs.gsettings-desktop-schemas
          pkgs.gtk3
          pkgs.adwaita-icon-theme
        ];

      in
      {
        devShells.default =
          (pkgs.buildFHSEnv {
            name = "flutter-env";
            targetPkgs =
              pkgs: with pkgs; [
                flutterFixed
                dart
                pkg-config

                # --- Dépendances UI & GTK (pour l'import d'images) ---
                gtk3
                glib
                libunwind
                orc
                libepoxy
                gsettings-desktop-schemas

                # --- Dépendances flutter_tester & Engine ---
                fontconfig
                libGL
                at-spi2-atk
                harfbuzz
                pango
                cairo
                zlib
                dbus
                libxcb
                libXext
                libXrender
                libXinerama
                libXi
                libXcursor
                libXdamage
                libXfixes
                libX11
                libXtst

                # --- Géo ---
                gdal
                geos
                proj
                libspatialite
              ];

            profile = ''
              # --- Géo ---
              export GDAL_LIBRARY_PATH="${pkgs.gdal}/lib/libgdal.so"
              export GEOS_LIBRARY_PATH="${pkgs.geos}/lib/libgeos_c.so"
              export SPATIALITE_LIBRARY_PATH="${pkgs.libspatialite}/lib/mod_spatialite.so"

              # --- FIX GSettings / Crash Image Picker ---
              # On construit le XDG_DATA_DIRS pour inclure les schémas GTK
              export XDG_DATA_DIRS="${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS"

              # --- Fontconfig ---
              export XDG_CACHE_HOME="$HOME/.cache"
              export FONTCONFIG_FILE=${pkgs.makeFontsConf { fontDirectories = [ pkgs.freefont_ttf ]; }}

              # --- Patch manuel flutter_tester (ton fallback) ---
              _FT_SRC="${flutterFixed}/bin/cache/artifacts/engine/linux-x64/flutter_tester"
              _FT_DST="$HOME/.cache/flutter-engine/linux-x64/flutter_tester"
              if [ -f "$_FT_SRC" ] && [ ! -x "$_FT_DST" ]; then
                mkdir -p "$(dirname "$_FT_DST")"
                cp "$_FT_SRC" "$_FT_DST"
                chmod +x "$_FT_DST"
                echo "✅ flutter_tester synchronisé dans le cache."
              fi

              echo "🚀 Environnement Flutter (FHS) chargé."
            '';
          }).env;
      }
    );
}
