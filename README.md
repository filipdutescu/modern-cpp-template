[![Actions Status](https://github.com/filipdutescu/modern-cpp-template/workflows/MacOS/badge.svg)](https://github.com/filipdutescu/modern-cpp-template/actions)
[![Actions Status](https://github.com/filipdutescu/modern-cpp-template/workflows/Windows/badge.svg)](https://github.com/filipdutescu/modern-cpp-template/actions)
[![Actions Status](https://github.com/filipdutescu/modern-cpp-template/workflows/Ubuntu/badge.svg)](https://github.com/filipdutescu/modern-cpp-template/actions)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/filipdutescu/modern-cpp-template)

# Modern CMake Template

A quick CMake template for modern C++ projects, aimed to be an easy to use starting point.

This is my personal take on such a type of template, thus I might not use the best practices or you might disagree with how I do things. Any and all feedback is greatly appreciated!

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

This project is meant to be only a template, thus versions of the software used can be change to better suit the needs of the developer(s). If you wish to use the template *as-is*, meaning using the versions recommended here, then you will need:

  * **CMake v3.15+** - found at [https://cmake.org/]
  * **C++ Compiler** - needs to support at least the **C++17** standard, i.e. *MSVC*, *GCC*, *Clang*

> ***Note:*** *You also need to be able to provide ***CMake*** a supported [generator](https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html).*

### Installing

It is fairly easy to install the project, all you need to do is clone if from [GitHub](https://github.com/filipdutescu/modern-cpp-template) or [generate a new repository from it](https://github.com/filipdutescu/modern-cpp-template/generate) (also on **GitHub**).

If you wish to clone the repository, rather than generate from it, you simply need to run
````bash
git clone https://github.com/filipdutescu/modern-cpp-template/
````

After finishing getting a copy of the project, with any of the methods above, create a new folder in the ```include/``` folder, with the name of your project.

You will also need to rename the ```cmake/Config.cmake.in``` file to start with the ***exact name of your project***. Such as ```cmake/MyNewProjectConfig.cmake.in```.

Finally, change ```"Project"``` from ```CMakeLists.txt```, from
````cmake
project(
  "Project"
  VERSION 0.1.0 
  LANGUAGES CXX
)
````

to the ***exact name of your project***, i.e. using the previous name it will become:
````cmake
project(
  MyNewProject
  VERSION 0.1.0 
  LANGUAGES CXX
)
````

## Building the project

To build the project, all you need to do, ***after correctly [installing the project](README.md#Installing)***, is run a similar **CMake** routine to the the one below:

````bash
mkdir build/ && cd build/
cmake .. -DCMAKE_INSTALL_PREFIX=/absolute/path/to/custom/install/directory
cmake --build . --target install
````

> ***Note:*** *The custom ```CMAKE_INSTALL_PREFIX``` can be omitted if you wish to install in [the default install location](https://cmake.org/cmake/help/latest/module/GNUInstallDirs.html).*

## Running the tests

By default, the template uses [Google Test](https://github.com/google/googletest/) for unit testing. Unit testing can be disabled in the options, by setting the `ENABLE_UNIT_TESTING` (from [cmake/StandardSettings.cmake]) to be false. To run the tests, simply use CTest, from the build directory, passing the desired configuration for which to run tests for. An example of this procedure is:

````bash
cd build          # if not in the build directory already 
ctest -C Release  # or `ctest -C Debug` or any other configuration you wish to test
````

### End to end tests

If applicable, should be presented here.

### Coding style tests

If applicable, should be presented here.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our how you can become a contributor and the process for submitting pull requests to us. Please read the [Code of Conduct](CODE_OF_CONDUCT.md) as well, before engaging with the project's community.

## Versioning

This project makes use of [SemVer](http://semver.org/) for versioning. A list of existing versions can be found in the [project's releases](https://github.com/filipdutescu/modern-cpp-template/releases). 

## Authors

* **Filip-Ioan Dutescu** - [@filipdutescu](https://github.com/filipdutescu)

## License

This project is licensed under the [Unilicense](https://unlicense.org) - see the [LICENSE](LICENSE) file for details
