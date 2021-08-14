#!/bin/bash
source /vagrant/lib.sh

# install the version that better honours peerAddress.
# see https://github.com/k0sproject/k0sctl
# NB because we need https://github.com/k0sproject/k0sctl/pull/169 (https://github.com/k0sproject/k0sctl/issues/168)
# NB because we need https://github.com/k0sproject/k0sctl/pull/181 (https://github.com/k0sproject/k0sctl/issues/179)
go install github.com/k0sproject/k0sctl@00637405fbf20c98bc8cf66adb283e1fefb39477

# move the release version out of the way.
if [ -f /usr/local/bin/k0sctl ] && [ ! -L /usr/local/bin/k0sctl ]; then
    mv /usr/local/bin/k0sctl{,.orig}
fi

# symlink to the built version.
ln -fs $HOME/go/bin/k0sctl /usr/local/bin
