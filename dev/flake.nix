{
  description = "Flake Defining My Preferred Dev Environmnent";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations.my-dev = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
		home.username = "asad";
            home.homeDirectory = "/home/asad";

            home.stateVersion = "23.11";

            programs.home-manager.enable = true;

            home.packages = with pkgs; [
              git
              neovim
              curl
              wget
              unzip
              zip
              tmux
              openjdk21
              maven
              docker
	      jetbrains.idea-community
	      vscode-with-extensions
	      iputils
	      bind
	      nmap
	      netTools
	      zoxide
	      bat
	      podman
            ];

            # optional: set environment variables or add config files
            home.sessionVariables = {
              EDITOR = "nvim";
              JAVA_HOME = "${pkgs.openjdk21}/lib/openjdk";
            };
          }
        ];
      };
    };
}

