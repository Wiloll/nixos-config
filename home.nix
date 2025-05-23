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
            gtk4
            zsh-completions
            zathura
            nemo
            dconf-editor
            p7zip
            ventoy-full
            alacritty
        ];
    };

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        shellAliases = 
        let
            flakePath = "~/nix";
        in {
            rebuild = "sudo nixos-rebuild switch --flake ${flakePath}";
            hms = "home-manager switch --flake ${flakePath}";
            c = "code";
        };
        ohMyZsh = {
            enable = true;
            plugins = [ "git" "thefuck" ];
            theme = "robbyrussell";
        };
        zplug = {
            enable = true;
            plugins = [
            { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
            { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
            ];
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