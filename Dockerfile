ARG COMPILER
ARG COMPILER_VERSION
ARG DISTRO
ARG DISTRO_VERSION

FROM conanio/${COMPILER}${COMPILER_VERSION}-${DISTRO}${DISTRO_VERSION}

ARG COMPILER
ARG CONAN_VERSION
ARG PYTHON_VERSION

RUN sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
    && sudo apt update \
    && DEBIAN_FRONTEND=noninteractive sudo apt install -y --no-install-recommends --no-install-suggests \
        build-essential \
        ghostscript \
        graphviz \
        latexmk \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxmlsec1-dev \
        texlive \
        texlive-font-utils \
        texlive-latex-extra \
        tk-dev \
        zlib1g-dev \
    && PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $PYTHON_VERSION \
    && pyenv global $PYTHON_VERSION \
    && pip install wheel conan==$CONAN_VERSION \
    && sudo apt remove -y \
        build-essential \
        # gcc may have been reinstalled, so remove it
        gcc \
        libbz2-dev \
        libffi-dev \
        liblzma-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libxmlsec1-dev \
        tk-dev \
        zlib1g-dev \
    && sudo apt autoremove -y \
    && sudo update-alternatives --install /usr/local/bin/cc cc /usr/local/bin/$COMPILER 100 \
