from django.conf.urls import url, include

urlpatterns = [
    url(r'^feature/', include('feature_request.api_urls')),
]