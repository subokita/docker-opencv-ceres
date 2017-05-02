FROM    ubuntu:16.04

RUN     apt-get update \
        &&  apt-get install -y \
            build-essential \
            cmake \
            git \
            libgtk2.0-dev \
            pkg-config \
            libavcodec-dev \
            libavformat-dev \
            libswscale-dev  \

            libgoogle-glog-dev \
            libatlas-base-dev \
            libeigen3-dev \
            libsuitesparse-dev

RUN     git clone https://github.com/opencv/opencv.git \
        &&  cd opencv \
        &&  mkdir release \
        &&  cd release \
        &&  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. \
        &&  make -j3 \
        &&  make install

RUN     git clone https://ceres-solver.googlesource.com/ceres-solver \
        &&  cd ceres-solver \
        &&  mkdir release \
        &&  cd release \
        &&  cmake .. \
        &&  make -j3 \
        &&  make test \
        &&  make install