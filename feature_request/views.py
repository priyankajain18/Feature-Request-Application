# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.base import TemplateView

from feature_request.models import Feature, Product, Client

class FeatureListingView(ListView):
    '''
    List all Feature Requests 
    '''

    template_name = 'feature_request/feature_listing.html'
    queryset = Feature.objects.order_by('target_date', 'priority')

class FeatureDetailView(DetailView):
    '''
    Retrieve Details of a Feature Request
    '''

    model = Feature
    template_name = 'feature_request/feature_detail.html'
    pk_url_kwarg = 'pk'

class FeatureAddView(TemplateView):
    '''
    Renders Add View of Feature Request
    '''

    model = Feature
    template_name = "feature_request/feature_add.html"

    def get_context_data(self, **kwargs):
        context = super(FeatureAddView, self).get_context_data(**kwargs)
        context['products'] = Product.objects.all()
        context['clients'] = Client.objects.all()
        return context

class FeatureEditView(TemplateView):
    '''
    Renders Edit View of Feature Request
    '''
    
    model = Feature
    template_name = 'feature_request/feature_edit.html'
    
    def get_context_data(self, **kwargs):
        context = super(FeatureEditView, self).get_context_data(**kwargs)
        try:
            context['feature'] = Feature.objects.get(id=self.kwargs.get('pk'))
        except Feature.DoesNotExist:
            context['feature'] = None

        context['products'] = Product.objects.all()
        context['clients'] = Client.objects.all()
        return context
