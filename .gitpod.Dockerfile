FROM gitpod/workspace-base

SHELL ["/bin/bash", "-c"]

RUN sh <(curl -L https://nixos.org/nix/install) --no-daemon

ENV PATH="/home/gitpod/.nix-profile/bin:${PATH}"

RUN nix-channel --update

RUN nix-env -iA nixpkgs.agda
