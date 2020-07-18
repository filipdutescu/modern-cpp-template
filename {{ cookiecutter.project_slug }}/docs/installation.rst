Installation of the template
============================

Prerequisites
~~~~~~~~~~~~~

This project is meant to be only a template, thus versions of the
software used can be change to better suit the needs of the
developer(s). If you wish to use the template *as-is*, meaning using the
versions recommended here, then you will need:

-  **CMake v3.15+** - found at https://cmake.org/

-  **C++ Compiler** - needs to support at least the **C++17** standard,
   i.e. *MSVC*, *GCC*, *Clang*

..

   **Note:** *You also need to be able to provide **CMake** a supported
   `generator <https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html>`_.*

Installing
~~~~~~~~~~

It is fairly easy to install the project, all you need to do is clone if
from `GitHub <https://github.com/filipdutescu/modern-cpp-template>`_ or
`generate a new repository from
it <https://github.com/filipdutescu/modern-cpp-template/generate>`_
(also on **GitHub**).

If you wish to clone the repository, rather than generate from it, you
simply need to run:

.. code:: bash

   git clone https://github.com/filipdutescu/modern-cpp-template/

After finishing getting a copy of the project, with any of the methods
above, create a new folder in the ``include/`` folder, with the name of
your project.

You will also need to rename the ``cmake/Config.cmake.in`` file to start
with the **exact name of your project**. Such as
``cmake/MyNewProjectConfig.cmake.in``.

Finally, change ``"Project"`` from ``CMakeLists.txt``, from

.. code:: cmake

   project(
     "Project"
     VERSION 0.1.0
     LANGUAGES CXX
   )

to the **exact name of your project**, i.e. using the previous name it
will become:

.. code:: cmake

   project(
     MyNewProject
     VERSION 0.1.0
     LANGUAGES CXX
   )

To install an already built project, you need to run the ``install``
target with CMake. For example:

.. code:: bash

   cmake --build build --target install --config Release

   # a more general syntax for that command is:
   cmake --build <build_directory> --target install --config <desired_config>

Building the project
--------------------

To build the project, all you need to do, **after
correctly `installing the project <README.md#Installing>`_**, is run
a similar **CMake** routine to the the one below:

.. code:: bash

   mkdir build/ && cd build/
   cmake .. -DCMAKE_INSTALL_PREFIX=/absolute/path/to/custom/install/directory
   cmake --build . --target install

..

   **Note:** *The custom ``CMAKE_INSTALL_PREFIX`` can be omitted if you
   wish to install in `the default install
   location <https://cmake.org/cmake/help/latest/module/GNUInstallDirs.html>`_.*

More options that you can set for the project can be found in the
```cmake/StandardSettings.cmake``
file <cmake/StandardSettings.cmake>`_. For certain options additional
configuration may be needed in their respective ``*.cmake`` files (i.e.
Conan needs the ``CONAN_REQUIRES`` and might need the ``CONAN_OPTIONS``
to be setup for it work correctly; the two are set in the
```cmake/Conan.cmake`` file <cmake/Conan.cmake>`_).

Generating the documentation
----------------------------

In order to generate documentation for the project, you need to
configure the build to use Doxygen. This is easily done, by modifying
the workflow shown above as follows:

.. code:: bash

   mkdir build/ && cd build/
   cmake .. -D<project_name>_ENABLE_DOXYGEN=1 -DCMAKE_INSTALL_PREFIX=/absolute/path/to/custom/install/directory
   cmake --build . --target doxygen-docs

..

   **Note:** *This will generate a ``docs\/`` directory in
   the **project's root directory**.*

Running the tests
-----------------

By default, the template uses `Google
Test <https://github.com/google/googletest/>`_ for unit testing. Unit
testing can be disabled in the options, by setting the
``ENABLE_UNIT_TESTING`` (from
`cmake/StandardSettings.cmake <cmake/StandardSettings.cmake>`_) to be
false. To run the tests, simply use CTest, from the build directory,
passing the desire configuration for which to run tests for. An example
of this procedure is:

.. code:: bash

   cd build          # if not in the build directory already
   ctest -C Release  # or `ctest -C Debug` or any other configuration you wish to test

   # you can also run tests with the `-VV` flag for a more verbose output (i.e.
   #GoogleTest output as well)

