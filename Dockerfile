FROM ubuntu:18.04

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y python3 python3-pip libatlas-base-dev wget gfortran libhdf5-dev libc-ares-dev libeigen3-dev libopenblas-dev libblas-dev liblapack-dev

RUN pip3 install --upgrade pip

RUN pip3 install --upgrade setuptools

RUN pip3 install pybind11 wheel

RUN pip3 install Cython==0.29.21

RUN pip3 install h5py

RUN pip3 install matplotlib

RUN pip3 install testresources numpy==1.16.1 future==0.17.1

RUN pip3 install mock==3.0.5 h5py==2.9.0

RUN pip3 install keras_preprocessing==1.1.0 keras_applications==1.0.8

RUN pip3 install gast==0.3.3

RUN pip3 install protobuf

RUN pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow==2.3.1+nv20.12

WORKDIR /work
