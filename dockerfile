FROM ruby:2.6.3
MAINTAINER code@briano.dev

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs \
  yarn

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./

#RUN bundle exec rails webpacker:install

EXPOSE 3000 3035

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-b", "0.0.0.0"]