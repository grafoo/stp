#! /usr/bin/env bash

declare -a pkgs

while read -r pkg
do
  if ! (pacman -Q "$pkg" > /dev/null 2>&1)
  then
    pkgs+=("$pkg")
  fi
done < "${HOME}/cfg/archlinux_package.lst"

sudo pacman -S "${pkgs[@]}"
