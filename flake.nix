{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in {

    nixosConfigurations = {

      qwerty = lib.nixosSystem {    
        system = "x86_64-linux";
        modules = [
          ./configurations/qwerty/configuration.nix
          ./configurations/common.nix
        ];
      };

      the-swan = lib.nixosSystem {    
        system = "x86_64-linux";
        modules = [
          ./configurations/the-swan/configuration.nix
          ./configurations/common.nix
        ];
      };

    };

    homeConfigurations = {
      hasan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./users/hasan/home.nix ];
      };
    };

  };
}
