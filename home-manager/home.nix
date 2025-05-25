{ config, pkgs, lib, ... }: {

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
            hypr = "c ~/.config/hypr/hyprland.conf`";
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
        profiles.default.userSettings = {
            "chat.editor.fontFamily" = "JetBrains Mono";
            "chat.editor.fontSize" = 17.333333333333332;
            "debug.console.fontFamily" = "JetBrains Mono";
            "debug.console.fontSize" = 17.333333333333332;
            "editor.fontFamily" = "JetBrains Mono";
            "editor.fontSize" = 17.333333333333332;
            "editor.inlayHints.fontFamily" = "JetBrains Mono";
            "editor.inlineSuggest.fontFamily" = "JetBrains Mono";
            "editor.minimap.sectionHeaderFontSize" = 11.142857142857142;
            "markdown.preview.fontFamily" = "Noto Sans";
            "markdown.preview.fontSize" = 17.333333333333332;
            "scm.inputFontFamily" = "JetBrains Mono";
            "scm.inputFontSize" = 16.095238095238095;
            "screencastMode.fontSize" = 69.33333333333333;
            "terminal.integrated.fontSize" = 17.333333333333332;
            "workbench.colorTheme" = lib.mkForce "Abyss";
            "git.enableSmartCommit" = true;
            "git.confirmSync" = false;
        };
    };
}