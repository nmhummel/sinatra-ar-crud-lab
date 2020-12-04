
require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  # so that your app will know how to handle PATCH, PUT, and DELETE requests!

  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
