{
  # Define the inputs we need
  inputs = {
    # We want to use `nixpkgs` to get access to a huge set of packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # We use the flake-parts framework to manage our flake structure
    flake-parts.url = "github:hercules-ci/flake-parts";
    # A compatibility shim to use Nix flakes with versions of Nix that don't
    # have native flake support.
    flake-compat = {
      url = "github:NixOS/flake-compat";
      flake = false;
    };
  };

  # Define the outputs the flake will provide
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      # Define for which system this flake will work on
      # We use a list of existing system available from `nixpkgs`.
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      # Define the outputs we want to expose for each available system
      perSystem =
        { pkgs, ... }:
        let
          # Change the Java version here if needed.
          jdk = pkgs.jdk21;
        in
        {
          # The 'default' development shell, use it with: `nix develop`
          devShells.default = pkgs.mkShellNoCC {
            # The list of packages this shell will provide
            # Feel free to add more packages if needed.
            # Find the list of available packages at https://search.nixos.org
            buildInputs = [
              jdk
              (pkgs.gradle.override { java = jdk; })
            ];

            shellHook = ''
              ${pkgs.figlet}/bin/figlet UMons
            '';
          };
        };
    };
}
