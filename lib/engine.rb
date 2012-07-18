require 'easypay'
require 'rails'
require 'action_controller'
require 'application_helper'

module Easypay
  class Engine < Rails::Engine

    # Config defaults
    config.easypay_notification_path = '/easypay/notifications.:format'
    config.easypay_forward_path = '/easypay/forwards.:format'
    config.easypay_payment_path = '/easypay/payments.:format'
    config.redirect_after_payment_path = '/easypay/completed'
    config.redirect_payment_notification_path = '/easypay/payment_completed'
    
    config.cin = 'cin provided by Easypay'
    config.user = 'user provided by Easypay'
    config.entity = 'entity provided by Easypay'
    config.code = ''
    
    # Load rake tasks
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'rails/railties/tasks.rake')
    end
    
    # Check the gem config
    initializer "check config" do |app|

      # make sure all routes end with trailing slash
      config.easypay_notification_path += '/'  unless config.easypay_notification_path.last == '/'
      config.easypay_forward_path += '/'  unless config.easypay_forward_path.last == '/'
      config.easypay_payment_path += '/'  unless config.easypay_payment_path.last == '/'
      config.redirect_after_payment_path += '/'  unless config.redirect_after_payment_path.last == '/'
      config.redirect_payment_notification_path += '/'  unless config.redirect_payment_notification_path.last == '/'
    end
    
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
    
  end
end