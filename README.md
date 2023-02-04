# conan-docker-images

These images are designed to provide a C++ build environment for a range of gcc and clang versions. It is based predominantly on the work done by the conan-io team in [conan-docker-tools](https://github.com/conan-io/conan-docker-tools/), with the following modifications:

* Upgraded Python version to 3.11.0. This was required for broad compatibility with sphinx themes and plugins, present in the documentation build alongside the libraries themselves.
* Addition of a TeXLive distribution, necessary for the generation of PDF documentation artifacts. This includes the following packages
    * texlive
    * texlive-latex-extra
    * texlive-fonts-utils
    * ghostscript
    * graphviz
    * latexmk
* Control over the conan version used. The conanio ubuntu 18.04 images appear to be updated infrequently, and at the time of writing were a number of versions behind.

## Usage

### Build all images

```bash
$ docker compose build
```

### Build an individual image

```bash
$ docker compose build gcc11
```

### Push all images to registry

```bash
$ docker compose push
```

### Images

Currently, it will generate the following images of the format `${DOCKER_USERNAME}/${COMPILER}${COMPILER_VERSION}-${DISTRO}${DISTRO_VERSION}:${DOCKER_TAG}`, which includes:

* samuelemrys/gcc10-ubuntu18.04:1.57.0
* samuelemrys/gcc11-ubuntu18.04:1.57.0
* samuelemrys/gcc12-ubuntu18.04:1.57.0
* samuelemrys/clang12-ubuntu18.04:1.57.0
* samuelemrys/clang13-ubuntu18.04:1.57.0
* samuelemrys/clang14-ubuntu18.04:1.57.0

Modification of some of these variables can be achieved through modification of the `.env` file. Modification of the compilers and versions will require modification of `docker-compose.yml`.

