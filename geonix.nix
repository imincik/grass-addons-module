#
# Use https://geospatial-nix.today to add more configuration.
#

{ inputs, config, lib, pkgs, ... }:

let
  geopkgs = inputs.geonix.packages.${pkgs.system};

in
{
  packages = [ ];

  applications.grass = {
    enable = true;
    plugins = p: [ geopkgs.grass-plugin-r-hydrodem geopkgs.grass-plugin-v-histogram ];
  };

  enterShell = ''
    grass --text --exec r.hydrodem --help
    grass --text --exec v.histogram --help
  '';
}
