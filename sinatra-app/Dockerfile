FROM ruby:3.2

WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy app code
COPY . .

# Expose Sinatra default port
EXPOSE 4567

# Run app
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "4567"]

