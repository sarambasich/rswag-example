FROM ruby:3.2.1

RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /workspace/rswag-example/src
COPY Gemfile Gemfile.lock /workspace/rswag-example/src/
RUN bundle install

CMD ["bundle", "exec", "rails" ,"s", "-b", "0.0.0.0"]
