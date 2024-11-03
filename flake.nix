{
  description = "Randcrack";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    randcrack-src = {
      url = "github:tna0y/Python-random-module-cracker?ref=0.2.0";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      randcrack-src,
    }:

    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.randcrack = pkgs.callPackage ./randcrack.nix { inherit randcrack-src; };
        packages.default = self.packages.${system}.randcrack;
      }
    );

}
