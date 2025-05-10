{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  #programs.hyprland.enable = true;
  services.gnome.core-utilities.enable = false;

  services.flatpak = {
    enable = true;
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = [ "nvidia" ];

    xkb = {
      layout  = "us,ua";
      variant = "workman,";
      options = "grp:win_space_toggle";
      };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;  # Or true, depending on your preference and GPU
    nvidiaSettings = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader     # ICD-завантажувач
      vulkan-tools      # утиліти типу vulkaninfo (за бажанням)
    ];
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;  
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.wilol = {
    isNormalUser = true;
    description = "wilol";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    pkgs.xorg.xrandr
    git
    home-manager
    gnome-console
    gnome-software
    nautilus
    efibootmgr
    #kitty
  ];

  system.stateVersion = "24.11";
}
