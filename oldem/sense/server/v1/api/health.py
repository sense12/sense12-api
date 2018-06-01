# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function

from flask import request, g

from . import Resource
from .. import schemas


class Health(Resource):

    def get(self):
        return {'message': 'Healhty/Ok'}
