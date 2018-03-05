# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.base import TemplateView
from django.views.generic.edit import CreateView

from rest_framework.response import Response

from feature_request.models import Feature, Product, Client
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

class FeatureAddView(TemplateView):
    model = Feature
    template_name = 'feature_request/feature_add.html'
    
    def get_context_data(self, **kwargs):
        context = super(FeatureAddView, self).get_context_data(**kwargs)
        context['products'] = Product.objects.all()
        context['clients'] = Client.objects.all()
        return context

    def post(self, request, *args, **kwargs):
        data = request.POST
        context = {}

        feature_data = {
            'title': data['title'],
            'description': data['description'],
            'priority': data['priority'],
            'client_id': data['client_id'], 
            'product_id': data['product_id'], 
            'target_date': data['target_date']
        }

        try:
            feature = Feature.objects.get(client_id=data['client_id'], priority=data['priority'])
            if feature:
                client_features = Feature.objects.filter(client_id=data['client_id'], priority__gte=data['priority'])
                for feature in client_features.order_by('-priority'):
                    feature.priority += 1
                    feature.save()
                Feature.objects.create(**feature_data)

        except Feature.DoesNotExist:
            Feature.objects.create(**feature_data)

        return Response(context)
