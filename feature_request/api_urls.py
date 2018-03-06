from django.conf.urls import url
from django.contrib.auth.decorators import login_required

from feature_request.api_views import *

urlpatterns = [
    url(r'^add/$', login_required(FeatureAddAPIView.as_view(), login_url="signin")),
]