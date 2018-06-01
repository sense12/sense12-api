# -*- coding: utf-8 -*-

###
### DO NOT CHANGE THIS FILE
### 
### The code is auto generated, your change will be overwritten by 
### code generating.
###
from __future__ import absolute_import

from .api.ideas import Ideas
from .api.ideas_uuid import IdeasUuid


routes = [
    dict(resource=Ideas, urls=['/ideas'], endpoint='ideas'),
    dict(resource=IdeasUuid, urls=['/ideas/<uuid>'], endpoint='ideas_uuid'),
]