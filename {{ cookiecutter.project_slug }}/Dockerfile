FROM ubuntu:18.04

RUN echo "Updating Ubuntu"
RUN apt update && apt upgrade -y

RUN echo "Installing dependencies..."
RUN apt install -y \
			catch \
			ccache \
			clang \
			clang-format \
			clang-tidy \
			cppcheck \
			doxygen \
			gcc \
			git \
			google-mock \
			googletest \
			make \
			python3 \
			python3-pip

RUN echo "Installing dependencies not found in the package repos..."
RUN apt install -y build-essential libssl-dev && \
			wget https://github.com/Kitware/CMake/releases/download/v3.15.0/cmake-3.15.0.tar.gz && \
			tar -zxvf cmake-3.15.0.tar.gz && \
			cd cmake-3.15.0 && \
			./bootstrap && \
			make && \
			make install 
RUN pip3 install conan

RUN echo "Copying project to Docker image"
RUN mkdir /home/docker
COPY . /home/docker/libcpp
RUN echo "Project can be found at '/home/docker/libcpp/'."
