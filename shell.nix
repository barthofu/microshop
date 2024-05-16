{ pkgs ? import <nixpkgs> {
  config.allowUnfree = true;
} }:
let
in
pkgs.mkShell {

	packages = with pkgs;
    [
      # languages
      python3
      go_1_22
      nodejs-20_x
      
      # tools
      git
      make
      docker
      kubectl
      helm
      k9s
    ];
    
    LC_ALL = "C.UTF-8";       
}