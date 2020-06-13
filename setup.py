#!/usr/bin/env python

import os
import sys

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

# Our version ALWAYS matches the version of Django we support
# If Django has a new release, we branch, tag, then update this setting after the tag.
version = "0.1"

with open("README.rst") as readme_file:
    long_description = readme_file.read()

setup(
    name="test-django-template",
    version=version,
    description="django template to play around",
    long_description=long_description,
    author="Aleksei Panfilov",
    author_email="aleert@yandex.ru",
    url="https://github.com/aleert/test-django-template",
    packages=[],
    license="BSD",
    zip_safe=False,
    classifiers=[
        "Environment :: Console",
        "Framework :: Django :: 3.0",
        "Natural Language :: English",
        "License :: OSI Approved :: BSD License",
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: Implementation :: CPython",
        "Topic :: Software Development",
    ],
    keywords=(
        "cookiecutter, Python, projects, project templates, django, "
        "skeleton, scaffolding, project directory, setup.py"
    ),
)
