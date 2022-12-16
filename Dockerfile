FROM python:3.9
ENV PYTHONUNBUFFERED 1

WORKDIR /app
COPY . .
RUN apt update
RUN apt-get -y install python3-pip && apt-get -y install python3-venv
RUN apt-get install -y apt-utils vim curl apache2 apache2-utils
RUN apt-get -y install libapache2-mod-wsgi-py3
COPY django_project.conf /etc/apache2/sites-available/
RUN a2ensite django_project  
RUN a2dissite 000-default.conf
RUN pip install -r requirements.txt
RUN chmod 777 /app/media_root




EXPOSE 80
CMD ["apache2ctl", "-D" ,"FOREGROUND"] 