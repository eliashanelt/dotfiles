{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        cursor-shape.insert = "bar";
        indent-guides.render = true;
        shell = ["nu" "-c"];

        line-number = "relative";
        auto-format = true;
        rulers = [100];
        color-modes = true;
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
          auto-format = true;
        }
        {
          name = "rust";
          auto-format = true;
        }
      ];
      language-server.rust-analyzer.config = {
        diagnostics.disabled = ["inactive-code"];
        check.command = "clippy";
      };
    };
  };
}
