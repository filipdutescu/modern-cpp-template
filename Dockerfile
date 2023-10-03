FROM ubuntu:22.04

RUN echo "Updating Ubuntu"
RUN apt-get update && apt-get upgrade -y

RUN echo "Installing dependencies..."
RUN apt install -y \
			ccache \
			clang \
			clang-format \
			clang-tidy \
			cppcheck \
			curl \
			doxygen \
			gcc \
			git \
			graphviz \
			make \
			ninja-build \
			python3 \
			python3-pip \
			tar \
			unzip \
			vim

RUN echo "Installing dependencies not found in the package repos..."

RUN apt install -y wget tar build-essential libssl-dev && \
			wget https://github.com/Kitware/CMake/releases/download/v3.15.0/cmake-3.15.0.tar.gz && \
			tar -zxvf cmake-3.15.0.tar.gz && \
			cd cmake-3.15.0 && \
			./bootstrap && \
			make && \
			make install 

RUN git clone https://github.com/microsoft/vcpkg -b 2020.06 && \
		cd vcpkg && \
		./bootstrap-vcpkg.sh -disableMetrics -useSystemBinaries	
