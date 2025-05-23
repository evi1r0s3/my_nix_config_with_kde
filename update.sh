#!/usr/bin/env bash
sudo chown evi1_f4iry:users .git &&
git add . &&
sudo nix flake update &&
git add . &&
sudo nixos-rebuild switch
