module Easypay
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'application_controller'
  require 'easypay/client'
end