import click

from .api import create_app




@click.group(help="""Sense12 entrypoint""")
@click.option("--verbose", "-v", default=False)
@click.option("--debug", default=False)
def sense12(verbose, debug):
    click.echo(' [sense12] Debug mode is %s' % ('on' if debug else 'off'))

@sense12.command('start-server')
@click.option("--host", default='127.0.0.1', help=' the hostname to listen on. Set this to "0.0.0.0" to have the server available externally as well. Defaults to "127.0.0.1"')
@click.option("--port", help='the port for server to run on')
def start_server(**kwargs):
    create_app().run(kwargs['host'], kwargs['port'], debug=False)


