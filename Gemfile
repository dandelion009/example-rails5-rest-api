source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.19.0'
# Use Puma as the app server
gem 'puma', '~> 3.7.1'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 0.4.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.8'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

# Support JSON Web Tokens for authentication
gem 'knock', '~> 2.1.1'

# Simplify JSON responses
gem 'active_model_serializers', '~> 0.10.0'

# Provide more readable output in the Rails console
gem 'awesome_print', '~> 1.7.0'

# Use Faker to seed the database
gem 'faker', '~> 1.7.3'

# Validate URLs
gem 'valid_url', '~> 0.0.4'
