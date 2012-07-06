Rails.application.routes.draw do
  match 'easypay.:format' => 'client#notify'
end