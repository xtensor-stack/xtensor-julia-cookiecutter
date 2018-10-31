import os
import subprocess

# Julia requires packages to be git repository.
# The Xtensor Julia Cookiecutter initialized a git repository with a single
# commit by default.
if '{{cookiecutter.git_init}}' == 'yes':
    git_cwd = os.getcwd()
    subprocess.call(['git', 'init'], cwd=git_cwd)
    subprocess.call(['git', 'add', '.'], cwd=git_cwd)
    subprocess.call([
        'git',
        '-c', 'user.email=xtensor.cookiecutter@quantstack.net',
        '-c', 'user.name="Xtensor Cookiecutter"',
        'commit', '-m', '"Xtensor Cookiecutter"',
    ], cwd=git_cwd)
