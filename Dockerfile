FROM ruby:2.4

MAINTAINER Manickam<manickam.subramaniam@thoughtbees.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /braincarve
WORKDIR /braincarve
COPY Gemfile /braincarve/Gemfile
COPY Gemfile.lock /braincarve/Gemfile.lock
RUN bundle install

COPY config/puma.rb config/puma.rb

COPY . /braincarve
# RUN curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-'uname -s'-'uname -m' -o /usr/local/bin/docker-compose
RUN  chmod 777 /braincarve/entrypoint.sh
EXPOSE 3000
    # RUN apt install python-pip
    # RUN 
# RUN bundle exec rake db:create db:migrate