|Actions Status| |Actions Status| |Actions Status| |codecov| |GitHub
release (latest by date)|

Modern C++ Template
===================

A quick C++ template for modern CMake projects, aimed to be an easy to
use starting point.

This is my personal take on such a type of template, thus I might not
use the best practices or you might disagree with how I do things. Any
and all feedback is greatly appreciated!

Features
--------

-  Modern **CMake** configuration and project, which, to the best of my
   knowledge, uses the best practices,

-  An example of a **Clang-Format** config, inspired from the base
   *Google* model, with minor tweaks. This is aimed only as a starting
   point, as coding style is a subjective matter, everyone is free to
   either delete it (for the *LLVM* default) or supply their own
   alternative,

-  **Static analyzers** integration, with *Clang-Tidy* and *Cppcheck*,
   the former being the default option,

-  **Doxygen** support, through the ``ENABLE_DOXYGEN`` option, which you
   can enable if you wish to use it,

-  **Unit testing** support, through *GoogleTest* (with an option to
   enable *GoogleMock*) or *Catch2*,

-  **Code coverage**, enabled by using the ``ENABLE_CODE_COVERAGE``
   option, through *Codecov* CI integration,

-  **Package manager support**, with *Conan* and *Vcpkg*, through their
   respective options

-  **CI workflows for Windows, Linux and MacOS** using *GitHub Actions*,
   making use of the caching features, to ensure minimum run time,

-  **.rst templates** for: *README*, *Contributing Guideliness*, *Issues*
   and *Pull Requests*,

-  **Permissive license** to allow you to integrate it as easily as
   possible. The template is licensed under the
   `Unlicense <https://unlicense.org/>`_,

-  Options to build as a header-only library or executable, not just a
   static or shared library.

-  **CCache** integration, for speeding up build times

Getting Started
---------------

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes.

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
from `GitHub <https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}>`_ or
`generate a new repository from
it <https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/generate>`_
(also on **GitHub**).

If you wish to clone the repository, rather than generate from it, you
simply need to run:

.. code:: bash

   git clone https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/

After finishing getting a copy of the project, with any of the methods
above, create a new folder in the ``include/`` folder, with the name of
your project.

You will also need to rename the ``cmake/Config.cmake.in`` file to start
with the **exact name of your project**. Such as
``cmake/MyNewProjectConfig.cmake.in``.

To install an already built project, you need to run the ``install``
target with CMake. For example:

.. code:: bash

   cmake --build build --target install --config Release

   # a more general syntax for that command is:
   cmake --build <build_directory> --target install --config <desired_config>

Building the project
--------------------

To build the project, all you need to do, **after
correctly `installing the project <README.rst#Installing>`_**, is run
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

End to end tests
~~~~~~~~~~~~~~~~

If applicable, should be presented here.

Coding style tests
~~~~~~~~~~~~~~~~~~

If applicable, should be presented here.

Contributing
------------

Please read `CONTRIBUTING.rst <CONTRIBUTING.rst>`_ for details on our how
you can become a contributor and the process for submitting pull
requests to us.

Versioning
----------

This project makes use of `SemVer <http://semver.org/>`_ for
versioning. A list of existing versions can be found in the `project's
releases <https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/releases>`_.

Authors
-------

-  **{{ cookiecutter.full_name }}** -
   `@{{ cookiecutter.github_username }} <https://github.com/{{ cookiecutter.github_username }}>`_

License
-------

This project is licensed under the
`Unlicense <https://unlicense.org/>`_ - see the `LICENSE <LICENSE>`_
file for details

.. |Actions Status| image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/workflows/MacOS/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions
.. |Actions Status| image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/workflows/Windows/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions
.. |Actions Status| image:: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/workflows/Ubuntu/badge.svg
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/actions
.. |codecov| image:: https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/branch/master/graph/badge.svg
   :target: https://codecov.io/gh/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}
.. |GitHub release (latest by date)| image:: https://img.shields.io/github/v/release/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}
   :target: https://github.com/{{ cookiecutter.github_username }}/{{ cookiecutter.project_slug }}/releases
