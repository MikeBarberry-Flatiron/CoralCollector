require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  "postgres://mike@localhost/coral-collector"
)

require_all 'app'
