# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function

from flask import request, g

from . import Resource
from .. import schemas


class IdeasUuid(Resource):

    def get(self, uuid):

        return {'created_at': 'something', 'link': 'something', 'uuid': 'something'}, 200, None

    def delete(self, uuid):

        return {'uuid': 'something'}, 200, None