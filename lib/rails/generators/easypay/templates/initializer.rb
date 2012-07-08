module Easypay
  class Engine < Rails::Engine

    config.mount_at = '/easypay'
    config.cin = 'cin provided by Easypay'
    config.user = 'user provided by Easypay'
    config.entity = 'entity provided by Easypay'
    # Code is needed only if you don't have validation by IP Address
    config.code = ''
       
  end
end