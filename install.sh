echo '  [x] Install OpenSSL'
brew install openssl

echo '  [x] Install autoconf automake and libtool'
brew install autoconf automake libtool

echo '  [x] Clone firebase Scrypt repo'
git clone https://github.com/firebase/scrypt.git

if hash brew 2>/dev/null; then
    opensslPath=$(brew --prefix openssl)
    export CFLAGS="$CFLAGS -I$opensslPath/include"
    export LDFLAGS="$LDFLAGS -L$opensslPath/lib"
fi

echo '  [x] Build Scrypt'
cd scrypt/
autoreconf -i
./configure
make