module Easypay
  class Engine < Rails::Engine

    config.easypay_notification_path = '/easypay/notifications.:format'
    config.easypay_forward_path = '/easypay/forwards.:format'
    config.easypay_payment_path = '/easypay/payments.:format'
    config.redirect_after_payment_path = '/easypay/completed'
    config.cin = 'cin provided by Easypay'
    config.user = 'user provided by Easypay'
    config.entity = 'entity provided by Easypay'
    # Code is needed only if you don't have validation by IP Address
    config.code = ''
       
  end
end