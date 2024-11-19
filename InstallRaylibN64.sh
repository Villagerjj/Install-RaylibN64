#!/bin/bash
set -e

echo "This will install the Static version of Raylib, Libdragon, and N64 Support for Raylib in the root of your home directory"
echo "This script COMPILES LIBDRAGON FROM SOURCE!! THIS WILL USE ~7 GB, and TAKE A LONG TIME!!! (~1 Hour)"

function Install_Raylib () {
  cd $HOME
  echo "Installing Requirements"
  sudo apt install build-essential git
  sudo apt install libasound2-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev libxinerama-dev libwayland-dev libxkbcommon-dev

  echo "Cloning the git repo"
  if [ -d "raylib" ];
  then
  echo "Cleaning up exisiting files"
  rm -Rf raylib
  fi

  git clone https://github.com/raysan5/raylib.git raylib
  cd raylib/src/
  #echo "Enabling OpenGL 1.1"
  #line="GRAPHICS = GRAPHICS_API_OPENGL_11"
  #sed -i "/${line}/ s/# *//" Makefile
  make PLATFORM=PLATFORM_DESKTOP
  sudo make install

}

function Install_Libdragon () {
  cd $HOME
  export N64_INST=$HOME/raylibdragon

  echo "Installing Requirements"
  sudo apt install texinfo

  #wget https://github.com/DragonMinded/libdragon/releases/download/toolchain-continuous-prerelease/gcc-toolchain-mips64-x86_64.deb

  if [ -d "libdragon" ];
  then
  echo "Cleaning up exisiting files"
  rm -Rf libdragon
  fi

  git clone https://github.com/DragonMinded/libdragon.git --branch unstable
  cd libdragon/tools
  echo "Grab some popcorn, this is gonna take a while"
  bash ./build-toolchain.sh
  cd ..
  bash ./build.sh
}

function Install_N64Support () {
  cd $HOME
  export N64_INST=$HOME/raylibdragon
  git clone https://github.com/raylib4Consoles/raylib4Nintendo64.git
  cd raylib4Nintendo64

  if [ -d "raylib" ];
  then
  echo "Cleaning up exisiting files"
  rm -Rf raylib
  fi

  ./nintendo64build.sh

}

read -r -p "Would you like to continue? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "Installing Raylib"
    Install_Raylib
    echo "Installing Libdragon"
    Install_Libdragon
    echo "Installing N64 Support into Raylib"
    Install_N64Support

    echo "Test the example roms in an emulator like Ares, if they work, delete tools/toolchain in the libdragon folder"
    echo "Btw, make sure to set your environment variable to this:"
    echo "export N64_INST=$HOME/raylibdragon"
else
    echo "Buh Bye!"
    exit
fi


