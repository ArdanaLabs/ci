{ config, pkgs, lib, inputs, ...}:
{
  environment.systemPackages = with pkgs; [ vim git ];
  nix = {
    trustedUsers = [ "@wheel" "root" ];
    package = pkgs.nixFlakes;
    extraOptions =
      let empty_registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}''; in
      ''
        experimental-features = nix-command flakes
        flake-registry = ${empty_registry}
        netrc-file = /run/agenix/netrcSecrets
      '';
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      substituters = [
        "https://cache.nixos.org"
        "https://hydra.iohk.io"
        "https://private-ardanalabs.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
        "private-ardanalabs.cachix.org-1:BukERsr5ezLsqNT1T7zlS7i1+5YHsuxNTdvcgaI7I6Q="
      ];
    };
  };
  age.secrets = {
    netrcSecrets = {
      file = "${inputs.self}/secrets/netrcSecrets.age";
      group = "root";
      owner = "root";
    };
  };
}

