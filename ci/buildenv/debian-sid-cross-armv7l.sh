# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool manifest ci/manifest.yml
#
# https://gitlab.com/libvirt/libvirt-ci

function install_buildenv() {
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get dist-upgrade -y
    apt-get install --no-install-recommends -y \
            augeas-lenses \
            augeas-tools \
            bash-completion \
            black \
            ca-certificates \
            ccache \
            codespell \
            cpp \
            diffutils \
            dwarves \
            ebtables \
            flake8 \
            gettext \
            git \
            grep \
            libclang-rt-dev \
            libnbd-dev \
            libxml2-utils \
            locales \
            make \
            meson \
            ninja-build \
            perl-base \
            pkgconf \
            python3 \
            python3-docutils \
            python3-pytest \
            qemu-utils \
            sed \
            xsltproc
    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen
    dpkg-reconfigure locales
    rm -f /usr/lib*/python3*/EXTERNALLY-MANAGED
    export DEBIAN_FRONTEND=noninteractive
    dpkg --add-architecture armhf
    apt-get update
    apt-get dist-upgrade -y
    apt-get install --no-install-recommends -y dpkg-dev
    apt-get install --no-install-recommends -y \
            gcc-arm-linux-gnueabihf \
            libacl1-dev:armhf \
            libapparmor-dev:armhf \
            libattr1-dev:armhf \
            libaudit-dev:armhf \
            libblkid-dev:armhf \
            libc6-dev:armhf \
            libcap-ng-dev:armhf \
            libcurl4-gnutls-dev:armhf \
            libdevmapper-dev:armhf \
            libfuse-dev:armhf \
            libglib2.0-dev:armhf \
            libgnutls28-dev:armhf \
            libiscsi-dev:armhf \
            libjson-c-dev:armhf \
            libnl-3-dev:armhf \
            libnl-route-3-dev:armhf \
            libnuma-dev:armhf \
            libparted-dev:armhf \
            libpcap0.8-dev:armhf \
            libpciaccess-dev:armhf \
            libreadline-dev:armhf \
            libsanlock-dev:armhf \
            libsasl2-dev:armhf \
            libselinux1-dev:armhf \
            libssh-dev:armhf \
            libssh2-1-dev:armhf \
            libtirpc-dev:armhf \
            libudev-dev:armhf \
            libxen-dev:armhf \
            libxml2-dev:armhf \
            systemtap-sdt-dev:armhf
    mkdir -p /usr/local/share/meson/cross
    printf "[binaries]\n\
c = '/usr/bin/arm-linux-gnueabihf-gcc'\n\
ar = '/usr/bin/arm-linux-gnueabihf-gcc-ar'\n\
strip = '/usr/bin/arm-linux-gnueabihf-strip'\n\
pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'\n\
\n\
[host_machine]\n\
system = 'linux'\n\
cpu_family = 'arm'\n\
cpu = 'armhf'\n\
endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabihf
    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt
    mkdir -p /usr/libexec/ccache-wrappers
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-cc
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-gcc
}

export CCACHE_WRAPPERSDIR="/usr/libexec/ccache-wrappers"
export LANG="en_US.UTF-8"
export MAKE="/usr/bin/make"
export NINJA="/usr/bin/ninja"
export PYTHON="/usr/bin/python3"

export ABI="arm-linux-gnueabihf"
export MESON_OPTS="--cross-file=arm-linux-gnueabihf"
