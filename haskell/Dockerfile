FROM aviralgoel/base

RUN DEBIAN_FRONTEND=noninteractive sudo -E apt-get -qy install haskell-stack
RUN stack -j1 install ghc-mod
RUN stack -j1 install hakyll
