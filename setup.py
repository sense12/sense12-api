from setuptools import setup, find_packages

def read_version():
    with open('VERSION', 'r') as f:
        return f.read()

setup(
    name="sense12",
    version=read_version(),
    packages=find_packages(),
    python_requires='>=3',
    description="This is an Example Package Sense12, Course material by Stefano Oldeman.",
    entry_points={
        'console_scripts': [
            'sense12 = oldem.sense.cli:sense12',
        ]
    },
    install_requires=[
        'requests==2.18.4',
        'Flask',
        'Jinja2',
        'Flask-RESTful',
        'jsonschema',
        'six'
    ]
)
