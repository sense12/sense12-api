import click

from .api import create_app




@click.command(help="""Sense12 entrypoint""")
@click.option("--host", default='127.0.0.1', help=' the hostname to listen on. Set this to "0.0.0.0" to have the server available externally as well. Defaults to "127.0.0.1"')
@click.option("--port", help='the port for server to run on')
@click.option("--verbose", "-v", default=False)
def sense12(host, port, verbose):
    create_app().run(host, port, debug=False)


