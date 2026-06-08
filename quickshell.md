# instructions for quickshell configs

## caelestia dependencies:
```bash
sudo pacman -S --needed --noconfirm \
  ddcutil\
  lm_sensors\
  fish\
  aubio\
  libpipewire\
  glibc\
  qt6-declarative\
  gcc-libs\
  ttf-material-symbols-variable\
  ttf-cascadia-code-nerd\
  swappy\
  libqalculate\
  bash\
  qt6-base\
  cmake\
  ninja\
  qt6-tools
```

```bash
yay -S --needed --noconfirm \
  caelestia-cli\
  quickshell-git\
  app2unit\
  libcava
  yay -S colloid-icon-theme-git
```

## Quickshell Celestia clone:
- clone the repo into quickshell folder in config
```bash
mkdir -p $XDG_CONFIG_HOME/quickshell
cd $XDG_CONFIG_HOME/quickshell
git clone https://github.com/caelestia-dots/shell.git caelestia

cd caelestia
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/
cmake --build build
sudo cmake --install build
```
