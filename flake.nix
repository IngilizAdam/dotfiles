{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      lib = nixpkgs.lib
    in {
    nixosConfigurations = {

      desktop = lib.nixosSystem {    
        system = "x86_64-linux";
        modules = [
          ./configurations/desktop/configuration.nix
          ./configurations/common.nix
        ];
      };

      laptop = lib.nixosSystem {    
        system = "x86_64-linux";
        modules = [
          ./configurations/laptop/configuration.nix
          ./configurations/common.nix
        ];
      };

    };
  };
}
