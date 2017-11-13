FROM ruby:2.4

RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev openssl libssl-dev libyaml-dev libreadline-dev libxml2-dev libxslt1-dev nodejs

ENV APP_HOME /forum/
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Add gemfile and install dependencies
COPY Gemfile $APP_HOME
COPY Gemfile.lock  $APP_HOME
RUN bundle install

# Add the rest
ADD . $APP_HOME