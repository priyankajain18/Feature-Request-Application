from django.conf.urls import url

from feature_request.views import FeatureListingView

urlpatterns = [
    url('^listing/', FeatureListingView.as_view()),
]