{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: let
  starshipSettings = {
    format = lib.concatStrings [
      "[](fg:primary)"
      "$os"
      "[](bg:primary fg:secondary)"
      "$username"
      "[](bg:secondary fg:tertiary)"
      "$directory"
      "[ ](fg:tertiary)"
      "$git_branch"
      "$git_status"
      "$all"
      "$character"
    ];

    username = {
      show_always = true;
      format = "[$user ](bg:secondary fg:on_secondary)";
      disabled = false;
    };

    os = {
      disabled = false;
      style = "bg:primary fg:on_primary";
      symbols = {
        Alpaquita = " ";
        Alpine = " ";
        AlmaLinux = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CachyOS = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Kali = " ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        Nobara = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        RockyLinux = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Void = " ";
        Windows = "󰍲 ";
      };
    };

    cmd_duration = {
      format = "[$duration](fg:tertiary)";
    };

    directory = {
      format = "[$path](bg:tertiary fg:on_tertiary)";
      truncation_length = 2;
      truncation_symbol = "…/";
      substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = "󰝚 ";
        "Pictures" = " ";
        "Scripts" = "󰲋 ";
      };
    };

    character = {
      success_symbol = "[](bold fg:primary)";
      error_symbol = "[✗](bold fg:error)";
      disabled = false;
    };

    fossil_branch = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    git_branch = {
      symbol = "  ";
      format = "[$symbol($branch) ($version)]($style)";
    };

    git_commit = {
      tag_symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    aws = {
      symbol = "   ";
      format = "[$symbol($version)]($style)";
    };

    buf = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    c = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    cmake = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    conda = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    crystal = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    dart = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    docker_context = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    elixir = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    elm = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    fennel = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    golang = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    guix_shell = {
      symbol = "   ";
      format = "[$symbol($version)]($style)";
    };

    haskell = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    haxe = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    hg_branch = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    hostname = {
      ssh_symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    java = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    julia = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    kotlin = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    lua = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    memory_usage = {
      symbol = " 󰍛 ";
      format = "[$symbol($version)]($style)";
    };

    meson = {
      symbol = " 󰔷 ";
      format = "[$symbol($version)]($style)";
    };

    nim = {
      symbol = " 󰆥 ";
      format = "[$symbol($version)]($style)";
    };

    nix_shell = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    nodejs = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    ocaml = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    package = {
      symbol = " 󰏗 ";
      format = "[$symbol($version)]($style)";
    };

    perl = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    php = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    pijul_channel = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    python = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    rlang = {
      symbol = " 󰟔 ";
      format = "[$symbol($version)]($style)";
    };

    ruby = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    rust = {
      symbol = " 󱘗 ";
      format = "[$symbol($version)]($style)";
    };

    scala = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    swift = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    zig = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };

    gradle = {
      symbol = "  ";
      format = "[$symbol($version)]($style)";
    };
  };

  noctaliaPalette = {
    palette = "noctalia";
    palettes = {
      noctalia = {
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

  starshipTemplate = (pkgs.formats.toml {}).generate "starship-noctalia-template.toml" (starshipSettings // noctaliaPalette);
  starshipConfigPath = "${config.home.homeDirectory}/.config/starship-noctalia.toml";
  starshipTemplatePath = "${config.home.homeDirectory}/.config/noctalia/templates/starship.toml";
in {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = starshipSettings;
  };

  home.sessionVariables = {
    STARSHIP_CONFIG = starshipConfigPath;
  };

  home.file.".config/noctalia/templates/starship.toml".source = starshipTemplate;
  home.file.".config/noctalia/user-templates.toml".text = ''
    [config]

    [templates.starship]
    input_path = "${starshipTemplatePath}"
    output_path = "${starshipConfigPath}"
  '';

  home.activation.seedStarshipNoctalia = lib.hm.dag.entryAfter ["writeBoundary"] ''
    set -eu

    config_dir="''${XDG_CONFIG_HOME:-$HOME/.config}"
    cache_dir="''${XDG_CACHE_HOME:-$HOME/.cache}"
    settings="$config_dir/noctalia/settings.json"
    templates="$config_dir/noctalia/user-templates.toml"
    output="$config_dir/starship-noctalia.toml"
    wallpapers="$cache_dir/noctalia/wallpapers.json"

    if [ -e "$output" ] || [ ! -f "$settings" ] || [ ! -f "$templates" ]; then
      exit 0
    fi

    mode="$(${pkgs.jq}/bin/jq -r '.colorSchemes.darkMode // true | if . then "dark" else "light" end' "$settings")"
    scheme_type="$(${pkgs.jq}/bin/jq -r '.colorSchemes.matugenSchemeType // "scheme-content"' "$settings")"
    wp=""

    if [ -f "$wallpapers" ]; then
      wp="$(${pkgs.jq}/bin/jq -r '.wallpapers | to_entries[0].value // .defaultWallpaper // empty' "$wallpapers")"
    fi

    if [ -z "$wp" ]; then
      exit 0
    fi

    ${pkgs.matugen}/bin/matugen image "$wp" --config "$templates" --mode "$mode" --type "$scheme_type" || true
  '';
}
