# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView

from feature_request.models import Feature
from feature_request.serializer import FeaturelistingSerializer

class FeatureListingView(ListView):
    model = Feature
    template_name = 'feature_request/feature_listing.html'

class FeatureDetailView(DetailView):
    model = Feature
    template_name = 'feature_request/feature_detail.html'

    def get_context_data(self, **kwargs):
        context = super(FeatureDetailView, self).get_context_data(**kwargs)
        try:
            context['feature'] = Feature.objects.get(id=self.kwargs.get('pk'))
        except Feature.DoesNotExist:
            context['feature'] = None
        return context

class FeatureAddView(CreateView):
    model = Feature
    template_name = 'feature_request/feature_add.html'
        