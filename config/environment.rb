require "bundler/setup"
Bundler.require
require "rake"
require "active_record"
require "sinatra"
require "sqlite3"
require "faker"

require_all "./app"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/app.db"
)
