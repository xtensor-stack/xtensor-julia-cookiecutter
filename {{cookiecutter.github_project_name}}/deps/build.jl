using BinDeps
using CxxWrap

@BinDeps.setup

build_type = "Release"
jlcxx_dir = Pkg.dir("CxxWrap", "deps", "usr", "share", "cmake", "JlCxx")
xtensor_dir = Pkg.dir("Xtensor", "deps", "usr", "share", "cmake", "xtensor")

prefix             = joinpath(dirname(@__FILE__), "usr")
extension_srcdir   = joinpath(dirname(@__FILE__), "{{ cookiecutter.cpp_package_name }}")
extension_builddir = joinpath(dirname(@__FILE__), "..", "builds", "{{ cookiecutter.julia_package_name }}")

# Set generator if on windows
@static if is_windows()
    genopt = "NMake Makefiles"
else
    genopt = "Unix Makefiles"
end

# Build on windows: push BuildProcess into BinDeps defaults
@static if is_windows()
  if haskey(ENV, "BUILD_ON_WINDOWS") && ENV["BUILD_ON_WINDOWS"] == "1"
    saved_defaults = deepcopy(BinDeps.defaults)
    empty!(BinDeps.defaults)
    append!(BinDeps.defaults, [BuildProcess])
  end
end

# Functions library for testing
example_labels = [:examples]
extension = BinDeps.LibraryDependency[]
for l in example_labels
   @eval $l = $(library_dependency(string(l), aliases=["lib" * string(l)]))
   push!(extension, eval(:($l)))
end

extension_steps = @build_steps begin
  `cmake -G "$genopt" -DCMAKE_PREFIX_PATH=$prefix -DCMAKE_INSTALL_PREFIX=$prefix -DCMAKE_BUILD_TYPE="$build_type" -DJlCxx_DIR=$jlcxx_dir -Dxtensor_DIR=$xtensor_dir $extension_srcdir`
  `cmake --build . --config $build_type --target install`
end

provides(BuildProcess,
  (@build_steps begin
    println("Building {{ cookiecutter.julia_package_name }}")
    CreateDirectory(extension_builddir)
    @build_steps begin
      ChangeDirectory(extension_builddir)
      extension_steps
    end
  end), extension)

@BinDeps.install Dict([
    (:examples, :_l_examples)
])

# Build on windows: pop BuildProcess from BinDeps defaults
@static if is_windows()
  if haskey(ENV, "BUILD_ON_WINDOWS") && ENV["BUILD_ON_WINDOWS"] == "1"
    empty!(BinDeps.defaults)
    append!(BinDeps.defaults, saved_defaults)
  end
end
