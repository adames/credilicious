require "./config/environment.rb"

use Rack::MethodOverride
use BorrowersController
run AppController
