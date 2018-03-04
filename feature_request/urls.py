from django.conf.urls import url

from feature_request.views import FeatureListingView, FeatureDetailView, FeatureAddView

urlpatterns = [
    url(r'^listing/$', FeatureListingView.as_view(), name="feature_listing"),
    url(r'^detail/(?P<pk>[0-9]+)/$', FeatureDetailView.as_view(), name="feature_detail"),
    url(r'^add/$', FeatureAddView.as_view(), name="feature_add"),
]