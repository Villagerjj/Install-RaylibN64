# Install-RaylibN64
This is a script that installs a complete version of raylib, libdragon, and raylib4Nintendo64

## Info
this installs n64 support to `raylibdragon` in your home directory (`export N64_INST=$HOME/raylibdragon`)

libdragon is also installed in your home directory
raylib is located inside the raylib4Nintendo64 folder in your home directory

this builds libdragon's toolchain from scratch! it will take somewere between 10 minutes to ~1 hour to complete, this also uses 7GB while compiling

you can delete `home/urname/libdragon/tools/toolcahin` to free up ~6gb of space AFTER confirming that everything works properly. 

## How to use
You need to run this on Debian, Ubuntu, or in a container running one of these distros.


download this script and run:
```
./InstallRaylibN64.sh
```

it will prompt for sudo when needed (this is only needed to install missing packages)

## Contributing
Feel free to improve this script! it is very simple, and could use some features that skip steps if things are already installed. just make a pull request and I will merge it!
