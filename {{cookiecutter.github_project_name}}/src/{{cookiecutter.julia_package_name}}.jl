__precompile__()

module {{ cookiecutter.julia_package_name }}
using CxxWrap

const depsfile = joinpath(dirname(dirname(@__FILE__)), "deps", "deps.jl")
if !isfile(depsfile)
  error("$depsfile not found, package {{ cookiecutter.julia_package_name }} did not build properly")
end
include(depsfile)

end
