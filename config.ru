require "./config/environment.rb"

use Rack::MethodOverride
use BorrowersController
use StaticController
run AppController
