<h1 align="center">
  <img src="https://files.artturin.com/files/nixoscolorful.svg" width="128" height="128" alt="Ferrix-NixOS" />
  <br>
  Ferrix
  <br>
</h1>

<h3 align="center">My personal NixOS configuration and dotfiles</h3>

<p align="center">
  <img src="https://img.shields.io/badge/Version-0.1.3-green") />
  <img src="https://img.shields.io/badge/nixpkgs-unstable-%237f7efe") />
  <img src="https://img.shields.io/badge/Licence-MIT-blue") />
</p>

<p align="center">
  <a href="#components">Components</a> •
  <a href="#installation">Installation</a> •
  <a href="#licence">Licence</a>
</p>

![Ferrix demo](/demo.png)

## Components

### To be added

## Installation

```bash
# Clone this repository
$ git clone https://github.com/LucasTF/Ferrix-dotfiles ~/.ferrix

# Go into the repository
$ cd ~/.ferrix

# Build the system configuration
$ sudo nixos-rebuild switch --flake .

# Load user configuration with Home Manager
$ home-manager switch --flake .
```

## Licence

MIT
