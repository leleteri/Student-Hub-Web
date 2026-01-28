{
  description = "Flake for web devleopment with react and python";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    python = pkgs.python313;

    frontendPackages = [
      pkgs.nodejs_20
      pkgs.nodePackages.typescript
      pkgs.nodePackages.eslint
      pkgs.nodePackages.prettier
    ];
    backendPackages = [
      (python.withPackages (ps: with ps; [
        typing
        fastapi
        uvicorn
        pydantic
        sqlalchemy
        alembic
        asyncpg
      ]))
      pkgs.postgresql_16
    ];
  in
  {
    devShells.${system} = rec {
      frontend = pkgs.mkShell {
        packages = [ frontendPackages ];
      };

      backend = pkgs.mkShell {
        packages = [ backendPackages ];
      };
    
      default = pkgs.mkShell {
        packages = [ frontendPackages backendPackages ];
      };
    };
  };
}
