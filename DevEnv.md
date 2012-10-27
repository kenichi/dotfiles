# Kenichi's Development Environment

__Always remap your caps lock key to control!__

### Default build instructions (from within a source tree):

```bash
./configure --prefix=/usr/local
make
sudo make install
```

## Steps

1. install XCode (AppStore)
2. install command-line tools (XCode)
3. install git (git-scm.org)
4. install GNU/OSS libraries/tools - any deviances from the default build instructions above are noted below each section
5. install [ruby](http://ftp.ruby-lang.org/pub/ruby) versions in /opt/ruby
6. symlink [dotfiles](https://github.com/kenichi/dotfiles) and other configuration
7. install [MacVim](https://github.com/b4winckler/macvim)
8. install [tig](https://github.com/jonas/tig.git) (ncurses-based Git client with vim-ish keybindings)
9. COMING SOON (postgres + postgis)

## Installing GNU/OSS libs and tools

The following libraries and tools will be needed. Mostly, use the default build instructions above except where noted.

  * [xz](http://tukaani.org/xz/xz-5.0.4.tar.gz)
  * [m4](http://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.xz)
  * [autoconf](http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz)
  * [automake](http://ftp.gnu.org/gnu/automake/automake-1.12.tar.xz)
  * [libiconv](http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz)
  * [libtool](http://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.xz)
  * [readline](ftp://ftp.cwru.edu/pub/bash/readline-6.2.tar.gz)
    * add these configure options `--disable-static --enable-shared`
    * patch source tree using `-p0` with [patch-shobj-conf.diff](https://raw.github.com/wayneeseguin/rvm/master/patches/readline-6.2/patch-shobj-conf.diff)
  * [ncurses](http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz)
  * [openssl](http://www.openssl.org/source/openssl-1.0.1c.tar.gz)
    * `./config --prefix=/usr/local`
  * [yaml](http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz)

## Installing Ruby versions

See the functions and aliases in my [.bash_profile](https://github.com/kenichi/dotfiles/blob/master/.bash_profile).

    sudo mkdir -p /opt/ruby
    sudo chown [you] /opt/ruby

#### 1.9.3-p286

    ./configure --prefix=/opt/ruby/1.9.3-p286 --enable-shared --disable-install-doc --with-opt-dir=/usr/local
    make
    make test
    make install

#### 1.9.2-p320

    ./configure --prefix=/opt/ruby/1.9.2-p320 --enable-shared --disable-install-doc --with-opt-dir=/usr/local
    make
    make test
    make install

#### 1.8.7-p358

* apply patches from RVM (this time with `-p1`)
  * [fix-irb-completion](https://github.com/wayneeseguin/rvm/raw/master/patches/ruby/1.8.7/fix-irb-completion.diff)
  * [osx-arch-fix](https://github.com/wayneeseguin/rvm/raw/master/patches/ruby/1.8.7/osx-arch-fix.patch)
* CFLAGS
  * define `HAVE_HMAC_CTX_COPY` and `HAVE_EVP_CIPHER_CTX_COPY` so `ext/openssl/openssl_missing.c` doesn't try to declare it
  * set include and lib dirs so readline module can find proper headers/libs
* configure options
  * configure will claim it doens't know about `--without-tcl` and `--without-tk`, but they actually do keep those modules from building 

```
export CFLAGS='-DHAVE_HMAC_CTX_COPY -DHAVE_EVP_CIPHER_CTX_COPY'
./configure --prefix=/opt/ruby/1.8.7-p358 --enable-shared --disable-install-doc --with-opt-dir=/usr/local --without-tcl --without-tk'
make
make test
make install
unset CFLAGS
```

#### [jruby 1.7.0](http://jruby.org.s3.amazonaws.com/downloads/1.7.0/jruby-bin-1.7.0.tar.gz)

__remember that the bin is called `jruby` (wr() function doesn't know about this)__

    cd /opt/ruby
    tar path/to/jruby-bin-1.7.0.tar.gz

#### rubinius

__COMING SOON__

### Symlinking and other configuration

Create the following symbolic links:

    .bash_profile -> /path/to/dotfiles/.bash_profile
    .gitconfig -> /path/to/dotfiles/.gitconfig
    .inputrc -> /path/to/dotfiles/.inputrc
    .irbrc -> /path/to/dotfiles/.irbrc
    .screen -> /path/to/dotfiles/.screen
    .screenrc -> /path/to/dotfiles/.screenrc
    .vim -> /path/to/dotfiles/.vim
    .vimrc -> /path/to/dotfiles/.vimrc

    .bash_profile -> .bashrc # for GNU Screen

Create the following dir:

    mkdir ~/.vimswap

### Installing MacVim

Clone the git repo then, from inside dir:

    cd src
    ./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --enable-perlinterp --enable-cscope
    make

MacVim.app will be in `src/MacVim/build/Release`. See the [.vim](https://github.com/kenichi/dotfiles/tree/master/.vim) dir and [.vimrc](https://github.com/kenichi/dotfiles/tree/master/.vimrc) file for my vim configuration.

### Installing tig

    export CFLAGS='-I/usr/local/include'
    export LDFLAGS='-L/usr/local/lib'
    ./autogen.sh
    ./configure --prefix=/usr/local
    make
    sudo make install
    unset CFLAGS LDFLAGS
