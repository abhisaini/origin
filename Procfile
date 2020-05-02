web: gunicorn Exam_Portal.wsgi:application --timeout 15
python manage.py collectstatic --noinput
manage.py migrate
