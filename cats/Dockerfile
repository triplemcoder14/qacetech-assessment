FROM ruby:3.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4567

ENV RACK_ENV=production

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "4567"]
