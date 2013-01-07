# Node Dev Setup

_assumes `RubyDevSetup` has already been done..._

### 0.8.16

* Download and untar the [source](http://nodejs.org/dist/v0.8.16/node-v0.8.16.tar.gz).
* configure:

```
./configure --prefix=/opt/node/0.8.16 \
            --shared-openssl \
            --shared-openssl-includes=/usr/local/include \
            --shared-openssl-libpath=/usr/local/lib \
            --shared-zlib \
            --shared-zlib-includes=/usr/local/include \
            --shared-zlib-libpath=/usr/local/lib

# make sure `/usr/bin/libtool` comes first (don't want GNU libtool here)
export _PATH=$PATH
export PATH=/usr/bin:$PATH

make
make install

# revert path
export PATH=$_PATH
unset _PATH
```
