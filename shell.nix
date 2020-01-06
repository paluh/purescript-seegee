let
  nodejs = pkgs."nodejs-10_x";
  easyPS = import (pkgs.fetchFromGitHub {
    owner = "paluh";
    repo = "easy-purescript-nix";
    rev = "505e04a5b3f2e0b00c67a8053f6917372f3b8816";
    # sha256 = "0hxdd39jyrsm1d1lhvh5qad2kvjygqxnnr0nn9rxqlcxbxvzgr6b";
    # sha256 = "016wvwypgb4859f0n1lqsqv9a8cca2y8g7d6ffvzx6rncd115gxi";
    sha256 = "10fxfxgbpr920bj69jail8vsj6qj5cf4g2r5brxiv23fz8nkzf5n";
  }) { inherit pkgs; };
  pkgs = import <nixpkgs> {};
  version = "v0.1.0";
in
  pkgs.stdenv.mkDerivation {
    buildInputs = [
      easyPS.spago
      easyPS."purs-0_13_5"
      easyPS.purty
      easyPS.zephyr

      pkgs.inotify-tools
      pkgs.libuuid
      pkgs.nix
      pkgs.jq
      pkgs.nodePackages.bower
      pkgs.nodePackages.jshint
      pkgs.nodePackages.yarn
      pkgs.nodejs
      pkgs.pkgconfig
      pkgs.postgresql
      pkgs.psc-package
      pkgs.python27
      pkgs.python35
      pkgs.stack
      pkgs.systemd
      pkgs.unzip


      # node-canvas related
      pkgs.cairo
      pkgs.libjpeg
      pkgs.pango
      pkgs.pixman
      pkgs.pkg-config
      pkgs.nodePackages."node-pre-gyp"
    ];
    name = "mosaic";
    shellHook = ''
      export EDITOR=vim
      export PATH=$PATH:./node_modules/.bin/:./bin
    '';
  }
