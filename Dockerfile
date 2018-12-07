FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs postgresql-dev git

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install tzinfo-data
RUN bundle install --binstubs

COPY . .

LABEL maintainer="CodeFund Team <team@codefund.io>"

CMD puma -C config/puma.rb