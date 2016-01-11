#! /bin/bash

release=$1

# get release version or set to default
[ -z $release ] && release="24.5"

# setup work dir
[ -d $HOME/src ] || mkdir $HOME/src

# install dependencies
# apt-get build-dep emacs24-nox would also be fine but installs +90 packages
sudo apt-get install \
  libacl1-dev \
  libdbus-1-dev \
  libfreetype6-dev \
  libgconf2-dev \
  libgif-dev \
  libgnutls28-dev \
  libgpm-dev \
  libjpeg-dev \
  libm17n-dev \
  libmagick++-dev \
  libotf-dev \
  libpng12-dev \
  librsvg2-dev \
  libtiff5-dev \
  libtinfo-dev \
  libxft-dev \
  libxml2-dev \
  zlib1g-dev

# get source tarball
if [ -d "$HOME/src/emacs-${release}" ]
then
  echo "emacs source ${release} already downloaded in $HOME/src/emacs-${release}"
  exit 1
else
  wget -O "$HOME/src/emacs-${release}.tar.xz" "https://ftp.gnu.org/gnu/emacs/emacs-${release}.tar.xz"
  echo "extracting emacs-${release}.tar.xz"
  tar -C "$HOME/src" -xf "$HOME/src/emacs-${release}.tar.xz"
  cd "$HOME/src/emacs-${release}"
  ./configure --prefix=$HOME/app/emacs --with-x-toolkit=no --with-xpm=no
  make && make install
  ln -s $HOME/app/emacs/bin/emacs-24.5 $HOME/bin/emacs
fi

