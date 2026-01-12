{
  config,
  pkgs,
  lib,
  ...
}: let
  dmsPalette = {
    palette = "dms";
    palettes = {
      dms = {
        primary = "{{colors.primary.default.hex}}";
        on_primary = "{{colors.on_primary.default.hex}}";
        secondary = "{{colors.secondary.default.hex}}";
        on_secondary = "{{colors.on_secondary.default.hex}}";
        tertiary = "{{colors.tertiary.default.hex}}";
        on_tertiary = "{{colors.on_tertiary.default.hex}}";
        surface = "{{colors.surface.default.hex}}";
        on_surface = "{{colors.on_surface.default.hex}}";
        surface_variant = "{{colors.surface_container.default.hex}}";
        on_surface_variant = "{{colors.on_surface_variant.default.hex}}";
        outline = "{{colors.outline_variant.default.hex}}";
        error = "{{colors.error.default.hex}}";
        on_error = "{{colors.on_error.default.hex}}";
      };
    };
  };

  starshipConfigPath = "${config.home.homeDirectory}/.config/starship-dms.toml";
  starshipTemplatePath = "${config.home.homeDirectory}/.config/matugen/templates/starship.toml";
  starshipTemplate = (pkgs.formats.toml {}).generate "starship-dms-template.toml" (config.programs.starship.settings // dmsPalette);

  hyprDmsConfigPath = "${config.home.homeDirectory}/.config/hypr/dms-colors.conf";
  hyprDmsTemplatePath = "${config.home.homeDirectory}/.config/matugen/templates/hypr-dms-colors.conf";
  hyprDmsTemplate = pkgs.writeText "hypr-dms-colors.conf" ''
    $primary = rgb({{colors.primary.default.hex_stripped}})
    $surface = rgb({{colors.surface.default.hex_stripped}})
    $secondary = rgb({{colors.secondary.default.hex_stripped}})
    $error = rgb({{colors.error.default.hex_stripped}})
    $tertiary = rgb({{colors.tertiary.default.hex_stripped}})
    $surface_lowest = rgb({{colors.surface_container_lowest.default.hex_stripped}})

    general {
        col.active_border = $primary
        col.inactive_border = $surface
    }

    group {
        col.border_active = $secondary
        col.border_inactive = $surface
        col.border_locked_active = $error
        col.border_locked_inactive = $surface

        groupbar {
            col.active = $secondary
            col.inactive = $surface
            col.locked_active = $error
            col.locked_inactive = $surface
        }
    }
  '';
in {
  home.sessionVariables = {
    STARSHIP_CONFIG = lib.mkForce starshipConfigPath;
  };

  home.file.".config/matugen/templates/starship.toml".source = starshipTemplate;
  home.file.".config/matugen/templates/hypr-dms-colors.conf".source = hyprDmsTemplate;
  home.file.".config/matugen/config.toml".text = ''
    [config]

    [templates.starship]
    input_path = "${starshipTemplatePath}"
    output_path = "${starshipConfigPath}"

    [templates.hyprland]
    input_path = "${hyprDmsTemplatePath}"
    output_path = "${hyprDmsConfigPath}"
  '';
}
