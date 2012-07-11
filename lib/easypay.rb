module Easypay
  require 'net/http'
  require 'net/https'
  require 'nokogiri'
  
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'application_controller'
  require 'easypay/client'
  require 'acts_as_payable/base'
end