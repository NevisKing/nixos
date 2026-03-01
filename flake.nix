{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        sops-nix.url = "github:Mic92/sops-nix";
        sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, sops-nix }@inputs: 
        let
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
            {
            # This makes it so nix run .#hello executes that package
            packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

            # This makes that package the default nix run
            packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

            # This makes it so nix develop has a shell with that package
            devShells.x86_64-linux.default = pkgs.mkShell {
                buildInputs = [ pkgs.neovim ];
            };

            nixosConfigurations.Ra = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./Ra/configuration.nix
                    ./common/obsidian.nix
                    ./common/spotify.nix
                    ./common/steam.nix
                    ./common/sops.nix
                    ./common/ssh.nix
                    ./nvidia/drivers.nix
                    ./common/docker.nix
                    ./common/jelly.nix
                    sops-nix.nixosModules.sops
                ];
            };
            nixosConfigurations.Anubis = nixpkgs.lib.nixosSystem {
                modules = [
                    ./Anubis/configuration.nix
                    ./common/ssh.nix
                ];
            };
        };
}

