# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.generic.list import ListView

from feature_request.models import Feature
from feature_request.serializer import FeaturelistingSerializer

class FeatureListingView(ListView):
    model = Feature
    template_name = 'feature_request/feature_listing.html'
