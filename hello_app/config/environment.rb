# Load the Rails application.
require_relative "application"

Rails.application.config.hosts << ENV["RAILS_DEVELOPMENT_HOSTS"] if ENV["RAILS_DEVELOPMENT_HOSTS"]

# Initialize the Rails application.
Rails.application.initialize!
