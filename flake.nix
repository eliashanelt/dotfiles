{
  description = "my dotfile config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.hera = nixpkgs.lib.nixosSystem{
      modules = [ ./configuration.nix  home-manager.nixosModules.default ];
    };
  };
}
