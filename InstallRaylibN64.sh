#!/bin/bash
set -e

echo "This will install the Static version of Raylib, Libdragon, and N64 Support for Raylib in the root of your home directory"
echo "This script COMPILES LIBDRAGON FROM SOURCE!! THIS WILL USE ~7 GB, and TAKE A LONG TIME!!! (~1 Hour)"


function Install_Libdragon () {
  cd $HOME
  export N64_INST=$HOME/raylibdragon

  echo "Installing Requirements"
  sudo apt install texinfo
  sudo apt install build-essential git
  sudo apt install libasound2-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev libxinerama-dev libwayland-dev libxkbcommon-dev

  #wget https://github.com/DragonMinded/libdragon/releases/download/toolchain-continuous-prerelease/gcc-toolchain-mips64-x86_64.deb

  if [ -d "libdragon" ];
  then
  echo "Cleaning up exisiting files"
  rm -Rf libdragon
  fi

  git clone https://github.com/DragonMinded/libdragon.git --branch preview
  cd libdragon/tools
  echo "Grab some popcorn, this is gonna take a while"
  bash ./build-toolchain.sh
  cd ..
  bash ./build.sh
}

function Install_N64Support () {
  cd $HOME
  export N64_INST=$HOME/raylibdragon

  if [ -d "raylib4Nintendo64" ];
  then
  echo "Cleaning up exisiting files"
  rm -Rf raylib4Nintendo64
  fi

  git clone https://github.com/raylib4Consoles/raylib4Nintendo64.git
  cd raylib4Nintendo64
  ./nintendo64build.sh

}

read -r -p "Would you like to continue? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Libdragon"
    Install_Libdragon
    echo "Installing Raylib for N64"
    Install_N64Support

    echo "Test the example roms in an emulator like Ares, if they work, delete tools/toolchain in the libdragon folder"
    echo "Btw, make sure to set your environment variable to this when compiling raylib stuff:"
    echo "export N64_INST=$HOME/raylibdragon"
else
    echo "Buh Bye!"
    exit
fi


