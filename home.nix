{ config, pkgs, ... }: {

    nixpkgs.config.allowUnfree = true;

    home = {
        username = "wilol";
        homeDirectory = "/home/wilol";
        stateVersion = "25.05";

        packages = with pkgs; [
            neofetch
            discord
            obsidian
            unityhub
            github-desktop
            steam
            onlyoffice-desktopeditors
            gtk3
            zsh-completions
            zathura
            nemo
            dconf-editor
            p7zip
            alacritty
            wofi
            hyprpaper
            mako
            brightnessctl
            playerctl
        ];
    };

    imports = [
        ./modules
    ];

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
        profiles.default.extensions = with pkgs.vscode-extensions; [
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