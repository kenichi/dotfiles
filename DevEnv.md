# Kenichi's Development Environment

Default build instructions (from within a source tree):

```
./configure --prefix=/usr/local
make
sudo make install
```

1. install XCode (AppStore)
2. install command-line tools (XCode)
3. install git (git-scm.org)
4. install GNU/OSS libraries/tools - any deviances from the default build instructions above are noted below each section
  * [xz](http://tukaani.org/xz/xz-5.0.4.tar.gz)
  * [m4](http://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.xz)
  * [autoconf](http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz)
  * [automake](http://ftp.gnu.org/gnu/automake/automake-1.12.tar.xz)
  * [libiconv](http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz)
  * [libtool](http://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.xz)
  * [readline](ftp://ftp.cwru.edu/pub/bash/readline-6.2.tar.gz)
    * add these configure options `--disable-static --enable-shared`
    * patch source tree with [patch-shobj-conf.diff](https://raw.github.com/wayneeseguin/rvm/master/patches/readline-6.2/patch-shobj-conf.diff)
  * [ncurses](http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz)
  * [openssl](http://www.openssl.org/source/openssl-1.0.1c.tar.gz)
    * `./Configure --prefix=/usr/local darwin64-x86_64-cc`
  * [yaml](http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz)
