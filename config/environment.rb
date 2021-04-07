require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  "postgres://mbarberry@localhost/test_db"
)

require_all 'app'