from setuptools import setup, find_packages

import unittest

setup(
    name="sense12",
    version='0.1.0',
    packages=find_packages(),
    python_requires='>=3',
    description="This is an Example Package Sense12, Course material by Stefano Oldeman.",
    # entry_points={
    #     'console_scripts': [
    #         'sense12 = oldem.sense.cli:main',
    #     ]
    # },
    install_requires=[
        'requests==2.18.4',
        'Flask',
        'Jinja2',
        'Flask-RESTful',
        'jsonschema',
        'six'
    ]
)
