FROM gitpod/workspace-base

SHELL ["/bin/bash", "-c"]

USER root

RUN apt-get update
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.utf8
ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8

USER gitpod

RUN sh <(curl -L https://nixos.org/nix/install) --no-daemon

ENV PATH="/home/gitpod/.nix-profile/bin:${PATH}"

RUN nix-channel --update

RUN nix-env -iA nixpkgs.agda
