{ config, pkgs, ... }:

{
  home.file.".bash_profile".text = ''
    exec Hyprland
  '';
}