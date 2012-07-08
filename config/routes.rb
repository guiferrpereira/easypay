Rails.application.routes.draw do

  mount_at = Easypay::Engine.config.mount_at

  match mount_at => 'easypay/clients#index'
  
  resources :clients, :only => [ :index ],
                          :controller => "easypay/clients",
                          :path_prefix => mount_at,
                          :name_prefix => "easypay_"

end