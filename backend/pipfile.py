[[source]]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[packages]
# Web Framework - Minor updates available
django = "==4.1.0"
djangorestframework = "==3.14.0"
django-cors-headers = "==3.13.0"
django-environ = "==0.9.0"
django-extensions = "==3.2.1"
# Database - Minor versions available
psycopg2-binary = "==2.9.5"
redis = "==4.3.0"
celery = "==5.2.0"
django-celery-beat = "==2.4.0"
sqlalchemy = "==1.4.44"
# Authentication & Security - Minor updates
pyjwt = "==2.6.0"
cryptography = "==38.0.0"
python-decouple = "==3.6"
bcrypt = "==4.0.0"
django-allauth = "==0.51.0"
# API & Serialization - Minor versions behind
marshmallow = "==3.19.0"
pydantic = "==1.10.0"
python-dateutil = "==2.8.1"
djangorestframework-simplejwt = "==5.2.1"
# Utilities - Minor updates needed
requests = "==2.28.0"
pillow = "==9.3.0"
pandas = "==1.5.0"
numpy = "==1.23.0"
python-dotenv = "==0.21.0"
arrow = "==1.2.2"
# Monitoring & Logging - Minor versions
sentry-sdk = "==1.12.0"
prometheus-client = "==0.15.0"
structlog = "==22.1.0"
# Cloud Services - Multiple minor versions behind
boto3 = "==1.26.0"
google-cloud-storage = "==2.6.0"
azure-storage-blob = "==12.14.0"
# Task Queue & Background Jobs
django-q = "==1.3.9"
huey = "==2.4.3"
# Caching
django-redis = "==5.2.0"
pylibmc = "==1.6.3"

[dev-packages]
# Testing - Minor updates available
pytest = "==7.2.0"
pytest-django = "==4.5.0"
pytest-cov = "==4.0.0"
factory-boy = "==3.2.1"
faker = "==15.3.0"
# Code Quality - Minor versions behind
black = "==22.10.0"
flake8 "==5.0.0"
mypy = "==0.982"
isort = "==5.10.1"
pylint = "==2.15.0"
bandit = "==1.7.4"
# Development Tools
ipython = "==8.6.0"
ipdb = "==0.13.9"
django-debug-toolbar = "==3.7.0"
watchdog = "==2.1.9"
# Documentation
sphinx = "==5.3.0"
sphinx-rtd-theme = "==1.1.1"

[requires]
python_version = "3.10"

[scripts]
server = "python manage.py runserver"
migrate = "python manage.py migrate"
makemigrations = "python manage.py makemigrations"
test = "pytest"
lint = "flake8 ."
format = "black ."
type-check = "mypy ."
shell = "python manage.py shell_plus"
