# Put in your configuration.nix
{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    
    ensureDatabases = [ "username" ];
    ensureUsers = [
      {
        name = "username";
        ensureDBOwnership = true;
      }
    ];
  };
}
