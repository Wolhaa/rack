require_relative 'middleware/logger'
require_relative 'middleware/runtime'
require_relative 'app'
use Rack::Reloader
use Runtime
use Applogger, logdev: File.expand_path('log/app.log', __dir__)
run App.new
