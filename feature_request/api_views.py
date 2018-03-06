from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from feature_request.models import Feature

class FeatureAddAPIView(APIView):
    def post(self, request, *args, **kwargs):
        data = request.POST
        
        feature_data = {
            'id': data['id'] or None,
            'title': data['title'],
            'description': data['description'],
            'priority': data['priority'],
            'client_id': data['client_id'], 
            'product_id': data['product_id'], 
            'target_date': data['target_date']
        }

        if feature_data.get('id', None):
            try:
                feature = Feature.objects.get(id=int(feature_data['id']))
                feature.title = feature_data['title']
                feature.description = feature_data['description']
                feature.product_id = feature_data['product_id']
                feature.target_date = feature_data['target_date']
                feature.save()
            except Feature.DoesNotExist:
                return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
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

        return Response(status=status.HTTP_201_CREATED)
