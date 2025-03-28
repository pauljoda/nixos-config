{
  lib,
  inputs,
  config,
  ...
}: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      format = lib.concatStrings [
        "[](fg:#${config.lib.stylix.colors.base0D-hex})"
        "$os"
        "[](bg:#${config.lib.stylix.colors.base0D-hex} fg:#${config.lib.stylix.colors.base08-hex})"
        "$username"
        "[](bg:#${config.lib.stylix.colors.base08-hex} fg:#${config.lib.stylix.colors.base0B-hex})"
        "$directory"
        "[ ](fg:#${config.lib.stylix.colors.base0B-hex})"
        "$git_branch"
        "$git_status"
        "$all"
        "$character"
      ];

      username = {
        show_always = true;
        format = "[$user ](bg:#${config.lib.stylix.colors.base08-hex} fg:black)";
        disabled = false;
      };

      os = {
        disabled = false;
        style = "bg:#${config.lib.stylix.colors.base0D-hex} fg:black";
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
        format = "[$duration](fg:#${config.lib.stylix.colors.base08-hex})";
      };

      directory = {
        format = "[$path](bg:#${config.lib.stylix.colors.base0B-hex} fg:black)";
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
        success_symbol = "[](bold #${config.lib.stylix.colors.base0D-hex})";
        error_symbol = "[✗](bold #${config.lib.stylix.colors.base08-hex})";
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
  };
}
