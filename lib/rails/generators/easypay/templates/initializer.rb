module Easypay
  class Engine < Rails::Engine

    config.mount_at = '/easypay'
    config.widget_factory_name = 'Factory Name'
        
  end
end