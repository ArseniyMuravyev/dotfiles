{
  description = "My Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
					pkgs.vim
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.enableSudoTouchIdAuth = true;

      nix.configureBuildUsers = true;

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 0;
        dock.show-recents = false;
        finder.ShowPathbar = true;
        finder.ShowStatusBar = true;
        dock.minimize-to-application = true;
        dock.wvous-br-corner = null;
        dock.wvous-bl-corner = null;
        dock.wvous-tr-corner = null;
        dock.wvous-tl-corner = null;
        loginwindow.GuestEnabled = false;
        trackpad.Dragging = true;
        trackpad.Clicking = true;
        trackpad.TrackpadThreeFingerDrag = true;
      };
      homebrew.enable = true;
      homebrew.casks = [
	      "wezterm"
      ];
      homebrew.brews = [
        "git"
        "zoxide"
        "eza"
        "starship"
        "neovim"
        "atuin"
        "zsh-autosuggestions"
        "tmux"
        "ripgrep"
				"lazygit"
				"zsh-syntax-highlighting"
				"bat"
				"nvm"
      ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."Arseniys-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Arseniys-MacBook-Air".pkgs;
  };
}
