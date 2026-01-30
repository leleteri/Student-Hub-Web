# Put in your configuration.nix
{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    
    ensureDatabases = [ "leleteri" ];
    ensureUsers = [
      {
        name = "leleteri";
        ensureDBOwnership = true;
      }
    ];
  };
}
