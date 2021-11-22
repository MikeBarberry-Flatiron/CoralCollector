require 'bundler/setup'

Bundler.require

configure :development do 
	ActiveRecord::Base.establish_connection("postgres://mike@localhost/coral-collector")
end

configure :production do 
 	ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"])
end

require_all 'app'
