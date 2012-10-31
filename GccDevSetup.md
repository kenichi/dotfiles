# GCC - 4.7.2 - let's install a late-model, non-LLVM compiler!

_props to http://staticimport.blogspot.com/2012/02/building-gcc-462-on-os-x-lion.html_

Make `/opt/gcc` and chown it to you.

### GMP

[gmp-5.0.5](ftp://ftp.gmplib.org/pub/gmp-5.0.5/gmp-5.0.5.tar.xz)

```bash
mkdir build
cd build
../configure --prefix=/opt/gcc/4.7.2
make
make check
make install
```

### MPFR

[mpfr-4.1.1](http://www.mpfr.org/mpfr-current/mpfr-3.1.1.tar.xz)

```bash
mkdir build
cd build
../configure --prefix=/opt/gcc/4.7.2 --with-gmp=/opt/gcc/4.7.2
make
make install
```

### MPC

[mpc-1.0.1](http://www.multiprecision.org/mpc/download/mpc-1.0.1.tar.gz)

```bash
mkdir build
cd build
../configure --prefix=/opt/gcc/4.7.2 --with-gmp=/opt/gcc/4.7.2 --with-mpfr=/opt/gcc/4.7.2
make
make install
```

### GCC

[gcc-4.7.2](http://www.netgull.com/gcc/releases/gcc-4.7.2/gcc-4.7.2.tar.bz2)

```bash
mkdir build
cd build
../configure --enable-languages=c,c++,objc --prefix=/opt/gcc/4.7.2 --with-gmp=/opt/gcc/4.7.2 --with-mpfr=/opt/gcc/4.7.2 --with-mpc=/opt/gcc/4.7.2
make
make install
cd /opt/gcc
ln -s 4.7.2 current
```

Now you can prepend `/opt/gcc/current/bin` to your path whenever you need this GCC :)
