{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hercules-ci-agent.url = "github:hercules-ci/hercules-ci-agent";
    agenix.url = "github:ryantm/agenix";
    nixinate.url = "github:matthewcroughan/nixinate";
  };
  outputs = { self, nixpkgs, hercules-ci-agent, agenix, nixinate }@inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    apps = nixinate.nixinate.x86_64-linux self;
    devShells.x86_64-linux.default = pkgs.mkShellNoCC {
      packages = with pkgs; [
        agenix.packages.x86_64-linux.agenix
        age-plugin-yubikey
      ];
    };
    nixosConfigurations.ardana-ax101 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        agenix.nixosModules.age
        hercules-ci-agent.nixosModules.multi-agent-service
        {
          _module.args = {
             nixinate = {
               hermetic = true;
               host = "65.108.238.221";
               sshUser = "deploy";
               buildOn = "remote";
             };
          };
        }
      ];
    };
  };
}
