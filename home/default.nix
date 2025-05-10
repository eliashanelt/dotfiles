{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./helix.nix
    ./waybar
    ./gtkTheme.nix
    ./wofi.nix
    ./wlogout
  ];
  home.username = "elias";
  home.packages = with pkgs; [nerd-fonts.iosevka];
  home.sessionVariables.EDITOR = "hx";

  programs.nushell = {
    enable = true;
    settings = {
      rm.always_trash = true;
      cursor_shape.emacs = "line";
      use_kitty_protocol = true;
    };
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Elias Hanelt";
    userEmail = "elias.hanelt@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    settings = {
      theme = "catppuccin-mocha";
      font-family = "Iosevka Nerd Font";
      font-size = 20;
    };
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 350;
        height = 150;
        offset = "11x11";
        origin = "top-right";
        transparency = 40;
        frame_color = "#aaaaaa00";
        font = "Monospace 10";
        separator_height = 2;
        padding = 5;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 0;
        gap_size = 10;
        corner_radius = 5;
        min_icon_size = 16;
        max_icon_size = 32;
      };

      urgency_normal = {
        background = "#181825";
        foreground = "#cdd6f4";
        timeout = 10;
      };

      urgency_critical = {
        background = "#f38ba8";
        foreground = "#ffffff";
        frame_color = "#f38ba8";
        timeout = 0;
      };
      urgency_low = {
        background = "#181825";
        foreground = "#cdd6f4";
        timeout = 6;
      };
    };
  };

  home.stateVersion = "24.11";
}
