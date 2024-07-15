FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN adduser --quiet --disabled-password qtuser && usermod -a -G audio qtuser

# This fix: libGL error: No matching fbConfigs or visuals found
ENV LIBGL_ALWAYS_INDIRECT=1

RUN apt-get update \
  && apt-get install -y \
  software-properties-common \
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt-get update \
  && apt-get install -y \
  python3.9 \
  python3.9-venv \
  python3.9-dev

RUN apt-get install -y \
  python3-pip \
  python3-pyqt5 \
  wget \
  libusb-1.0.0-dev \
  libudev-dev \
  pkg-config \
  && apt-get clean

WORKDIR /app

RUN python3.9 -m pip install -U pysqlite3-binary
RUN python3.9 -m pip install wheel \
  && python3.9 -m pip install cython==0.29.36

RUN wget https://github.com/electrumsv/electrumsv/archive/refs/tags/sv-1.3.16.tar.gz && tar -xf sv-1.3.16.tar.gz && rm -f sv-1.3.16.tar.gz
RUN python3.9 -m pip install -r ./electrumsv-sv-1.3.16/contrib/deterministic-build/linux-py3.9-requirements-electrumsv.txt

USER qtuser
CMD [ "python3.9", "./electrumsv-sv-1.3.16/electrum-sv" ]
