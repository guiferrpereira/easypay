Rails.application.routes.draw do

  match Easypay::Engine.config.easypay_notification_path => 'easypay/notifications#simple_notification'
  match Easypay::Engine.config.easypay_forward_path => 'easypay/notifications#notification_to_forward'
  match Easypay::Engine.config.easypay_payment_path => 'easypay/notifications#notification_from_payment'
  match Easypay::Engine.config.redirect_after_payment_path => 'easypay/payments#complete', :as => :payment_redirect
  
end