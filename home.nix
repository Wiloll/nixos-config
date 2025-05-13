{ config, pkgs, ... }: {

    nixpkgs.config.allowUnfree = true;

    home = {
        username = "wilol";
        homeDirectory = "/home/wilol";
        stateVersion = "24.11";

        packages = with pkgs; [
            neofetch
            discord
            obsidian
            unityhub
            github-desktop
            steam
            onlyoffice-desktopeditors
            gparted
        ];
    };

    programs.bash = {
        enable = true;
        shellAliases = 
        let
            flakePath = "~/nix";
        in {
            rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
            hms = "home-manager switch --flake ${flakePath}";
            c = "code";
        };
    };

    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            ms-python.python
            bbenoist.nix
            esbenp.prettier-vscode
            pkief.material-icon-theme
            github.copilot
            github.github-vscode-theme
            johnpapa.vscode-peacock
        ]; 
    };
}