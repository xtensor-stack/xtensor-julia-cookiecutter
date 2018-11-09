# ![xtensor-cookiecutter](xtensor-cookiecutter.svg)

[![Travis](https://travis-ci.org/QuantStack/xtensor-julia-cookiecutter.svg?branch=master)](https://travis-ci.org/QuantStack/xtensor-julia-cookiecutter)
[![Appveyor](https://ci.appveyor.com/api/projects/status/p3g5252ubpi0am6x?svg=true)](https://ci.appveyor.com/project/QuantStack/xtensor-julia-cookiecutter)
[![Documentation Status](https://readthedocs.org/projects/xtensor/badge/?version=latest)](https://xtensor.readthedocs.io/en/latest/?badge=latest)
[![Join the Gitter Chat](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/QuantStack/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

#### A [cookiecutter](https://github.com/audreyr/cookiecutter) template for creating a custom Julia extension with xtensor

## What is xtensor-julia-cookiecutter?

`xtensor-julia-cookiecutter` helps extension authors create Julia extension modules making use of xtensor.

It takes care of the initial work of generating a project skeleton with

- A complete Julia package comprising the extension module
- A few examples included in the resulting project including

    - A universal function defined from C++
    - A function making use of an algorithm from the STL on a Julia N-D array
    - Unit tests
    - The generation of the HTML documentation with sphinx

## Usage

Install [cookiecutter](https://github.com/audreyr/cookiecutter):

    $ pip install cookiecutter

After installing cookiecutter, use the xtensor-julia-cookiecutter:

    $ cookiecutter https://github.com/QuantStack/xtensor-julia-cookiecutter.git

As xtensor-julia-cookiecutter runs, you will be asked for basic information about
your custom extension project. You will be prompted for the following
information:

- `author_name`: your name or the name of your organization,
- `author_email`: your project's contact email,
- `github_project_name`: name of the GitHub repository for your project,
- `github_organization_name`: name of the GithHub organization for your project,
- `julia_package_name`: name of the Python package created by your extension,
- `cpp_namespace`: name for the cpp namespace holding the implementation of your extension,
- `project_short_description`: a short description for your project.

This will produce a directory containing all the required content for a minimal extension
project making use of xtensor with all the required boilerplate for package management,
together with a few basic examples.

## Resources

- [Documentation of xtensor](https://xtensor.readthedocs.io)
- [Documentation of xtensor-julia](https://xtensor-julia.readthedocs.io)
