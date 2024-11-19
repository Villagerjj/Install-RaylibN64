# Install-RaylibN64
This is a script that installs a complete version of raylib, libdragon, and raylib4Nintendo64

## Info
this install everything to `raylibdragon` your home directory (`export N64_INST=$HOME/raylibdragon`)

this builds libdragon's toolchain from scratch! it will take somewere between 10 minutes to ~1 hour to complete, this also uses 7GB while compiling
you can delete `home/urname/libdragon/tools/toolcahin` to free up ~6gb of space AFTER confirming that everything works properly. 

## How to use
You need to run this on Debian, Ubuntu, or in a container running one of these distros
download the script and run:

```
./InstallRaylibN64.sh
```

it will prompt for sudo when needed (used to install packages)

## Contributing
Feel free to improve this script! it is very simple, and could use some features that skip steps if things are already installed. just make a pull request and I will merge it!
