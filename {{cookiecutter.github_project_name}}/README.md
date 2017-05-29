{{ cookiecutter.github_project_name }}
==============

{{ cookiecutter.project_short_description }}


Installation
------------

First, clone this repository, then from the julia command line

 - `Pkg.clone("path/to/project")`
 - `Pkg.build("{{ cookiecutter.julia_package_name }}")`


Building the documentation
--------------------------

Documentation for the example project is generated using Sphinx. Sphinx has the
ability to automatically inspect the signatures and documentation strings in
the extension module to generate beautiful documentation in a variety formats.
The following command generates HTML-based reference documentation; for other
formats please refer to the Sphinx manual:

 - `cd {{ cookiecutter.github_project_name }}/docs`
 - `make html`


Running the tests
-----------------

```bash
Pkg.test("{{ cookiecutter.julia_package_name }}")
```
