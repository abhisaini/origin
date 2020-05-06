web: gunicorn Exam_Portal.wsgi:application --timeout 150
python manage.py collectstatic --noinput
manage.py migrate
