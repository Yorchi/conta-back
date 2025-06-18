# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.4
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

RUN sudo apt-get update -qq && \
    sudo apt-get install --no-install-recommends -y curl libjemalloc2 libvips sqlite3 postgresql-client && \
    sudo apt-get update -qq && \
    sudo apt-get install --no-install-recommends -y libpq-dev && \
    sudo rm -rf /var/lib/apt/lists /var/cache/apt/archives
