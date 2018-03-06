from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from feature_request.views import *

urlpatterns = [
    url(r'^listing/$', login_required(FeatureListingView.as_view(), login_url="signin"), name="feature_listing"),
    url(r'^detail/(?P<pk>[0-9]+)/$', login_required(FeatureDetailView.as_view(), login_url="signin"), name="feature_detail"),
    url(r'^add/$', login_required(FeatureAddView.as_view(), login_url="signin"), name="feature_add"),
    url(r'^edit/(?P<pk>[0-9]+)/$', login_required(FeatureEditView.as_view(), login_url="signin"), name="feature_edit"),
]