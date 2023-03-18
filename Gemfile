source "https://rubygems.org"

ruby '3.2.1'

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"

# gem 'rswag', '~> 2.8.0'

group :development, :test do
	gem 'rspec-rails', '~> 6.0.1'
end

group :development do
	# NOTE: debase seems to have issues with Ruby 3.2: https://github.com/ruby-debug/debase/issues/95#issuecomment-1260555341
	# gem 'debase', '0.2.5.beta2', require: false
	# gem 'ruby-debug-ide'
end

