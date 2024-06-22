# Use the official Ruby image as the base image
FROM ruby:3.3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# Set the working directory inside the container
WORKDIR /web_app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /web_app/Gemfile
COPY Gemfile.lock /web_app/Gemfile.lock

# Install the gems specified in Gemfile
RUN bundle install

# Copy the main application into the container
COPY . /web_app

# Expose the port the app runs on
EXPOSE 3000

# Start the main process (Rails server)
CMD ["rails", "server", "-b", "0.0.0.0"]
