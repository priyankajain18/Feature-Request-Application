from django.test import Client, TestCase

from users.models import EmployeeDepartment, CustomUser
from feature_request.models import Feature, Product
from feature_request.models import Client as FeatureClient

class TestFeatureRequest(TestCase):
    def setUp(self):
        self.client = Client()

        # Create Department
        self.department = EmployeeDepartment.objects.create(name="Test Department", description="Test Department", \
            d_code="TD")

        # Create Client
        self.feature_client = FeatureClient.objects.create(name="Test Client")
        
        self.product1 = Product.objects.create(name="Test Product 1") # Create Product 1
        self.product2 = Product.objects.create(name="Test Product 2") # Create Product 2

        self.priority = 1

        # User SignUp Test Data
        self.user_signup_data1 = {
            "first_name": "Test First Name",
            "last_name": "Test Last Name",
            "email": "test@gmail.com",
            "contact_number": "9899989998",
            "e_code": "FL-FA",
            "password": "123456",
            "d_code": self.department.id
        }

        # User SignIn Test Data
        self.user_signin_data1 = {
            "email": "test@gmail.com",
            "password": "123456"
        }

        # Feature Request Test Data 1
        self.feature_request_data1 = {
            'id': '',
            'title': 'Attach Policies',
            'description': 'Attach Policies',
            'client_id': self.feature_client.id,
            'priority': self.priority,
            'product_id': self.product1.id,
            'target_date': '2018-03-31 00:00:00.000000'
        }

        # Feature Request Test Data 2
        self.feature_request_data2 = {
            'id': '',
            'title': 'Attach Claims',
            'description': 'Attach Claims',
            'client_id': self.feature_client.id,
            'priority': self.priority,
            'product_id': self.product2.id,
            'target_date': '2018-12-31 00:00:00.000000'
        }

    def test_00_redirect_signin(self):
        '''
        Test if signin is required before requesting a new feature
        '''
        response = self.client.get('/feature/listing/')
        self.assertRedirects(response, '/sign-in/?next=/feature/listing/')

    def test_01_user_signup(self):
        '''
        Test User SignUp Functionality
        '''
        self.client.get('/sign-up/')
        response = self.client.post('/sign-up/', self.user_signup_data1)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(CustomUser.objects.count(), 1)

    def test_02_user_signin(self):
        '''
        Test User SignIn Functionality
        '''
        self.client.post('/sign-up/', self.user_signup_data1)
        response = self.client.post('/sign-in/', self.user_signin_data1)
        self.assertEqual(response.status_code, 200)

    def test_03_add_feature_request(self):
        '''
        Test add a new feature
        '''
        self.client.post('/sign-up/', self.user_signup_data1)
        self.client.post('/sign-in/', self.user_signin_data1)
        
        self.assertEqual(Feature.objects.count(), 0)
        self.client.post('/api/feature/add/', self.feature_request_data1)
        self.assertEqual(Feature.objects.count(), 1)

    def test_04_reorder_priority_feature_request(self):
        '''
        Test if requesting a new feature with a priority that already exists in the
        database for a particular client, then reordering of priority takes place or not
        for all the features corresponding to that client
        '''
        self.client.post('/sign-up/', self.user_signup_data1)
        self.client.post('/sign-in/', self.user_signin_data1)

        self.client.post('/api/feature/add/', self.feature_request_data1)
        feature1 = Feature.objects.get(client=self.feature_client, product=self.product1)
        self.assertEqual(feature1.priority, 1)

        self.client.post('/api/feature/add/', self.feature_request_data2)
        feature2 = Feature.objects.get(client=self.feature_client, product=self.product2)
        self.assertEqual(feature2.priority, 1)

        feature1 = Feature.objects.get(client=self.feature_client, product=self.product1)
        self.assertEqual(feature1.priority, 2)

    def test_05_edit_feature_request(self):
        '''
        Test Edit Feature Request Functionality
        '''
        self.client.post('/sign-up/', self.user_signup_data1)
        self.client.post('/sign-in/', self.user_signin_data1)

        self.client.post('/api/feature/add/', self.feature_request_data1)

        feature = Feature.objects.get(client=self.feature_client, priority=self.priority)
        self.assertEqual(feature.title, "Attach Policies")
        self.assertEqual(feature.description, "Attach Policies")

        self.feature_request_edit_data = {
            'id': feature.id,
            'title': 'Attach Test Policies',
            'description': 'Attach Test Policies',
            'priority': feature.priority,
            'client_id': feature.client.id,
            'product_id': self.product1.id,
            'target_date': '2018-05-31 00:00:00.000000'
        }
        response = self.client.post('/api/feature/add/', self.feature_request_edit_data)
        
        feature = Feature.objects.get(client=self.feature_client, priority=self.priority)
        self.assertEqual(feature.title, "Attach Test Policies")
        self.assertEqual(feature.description, "Attach Test Policies")

if __name__ == '__main__':
    unittest.main()
