# Feature-Request-Application
Feature Request Application

## Installation
1. Initial Setup
```
mkdir Project
cd Project
virtualenv --no-site-packages .
source bin/activate
```
2. Clone the repository
```
git clone https://github.com/priyankajain18/Feature-Request-Application.git
cd Feature-Request-Application/
pip install -r requirements.txt
```
3. Database setup
```
settings.py
------------
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': database_name,
        'USER': user,
        'PASSWORD': password,
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
mysql -uuser -ppassword -h localhost database_name < feature_request.sql
```
4. Set SECRET_KEY
```
SECRET_KEY = your_secret_key
```
5. Collect static files
```
python manage.py collectstatic
```
6. Start server
```
python manage.py runserver
Access http://127.0.0.1:8000/weather-report/
```