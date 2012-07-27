Easypay
=========

_Easypay_ is a Ruby client for [Easypay](http://www.easypay.pt/) payment platform that allows payments with credit cards and (MB references to Portugal)

Installation
------------

OK. First, you need to talk with people from Easypay to get your credentials!

Now, let's install the gem via Rubygems:

    $ gem install easypay

Or in your Gemfile:

    $ gem 'easypay'
    
After bundle:
    
    $ rails generate easypay
    $ rake db:migrate

Check on your initializers folder for easypay.rb and change the parameters:

```ruby

  # CIN USER and ENTITY, are required
  config.cin = 'cin provided by Easypay'
  config.user = 'user provided by Easypay'
  config.entity = 'entity provided by Easypay'

  # Code is needed only if you don't have validation by IP Address
  config.code = "Code is needed only if you don't have validation by IP Address (Configure on Easypay Backoffice)"
  
  # Change routes in order to work them on your app
  config.easypay_notification_path = '/easypay/notifications.:format'
  config.easypay_forward_path = '/easypay/forwards.:format'
  config.easypay_payment_path = '/easypay/payments.:format'
  config.redirect_after_payment_path = '/easypay/completed'
  config.redirect_payment_notification_path = '/easypay/payment_completed'
```

Basic configuration
-----

In your model, add:

```ruby
  acts_as_payable :name => 'your_model_name_attr_if_different_from_name', 
                  :email => 'your_model_email_attr_if_different_from_email', 
                  :mobile => 'your_model_mobile_attr_if_different_from_mobile',
                  :item_description => 'your_model_item_description_attr_if_different_from_item_description', 
                  :item_quantity => 'your_model_item_quantity_attr_if_different_from_item_quantity', 
                  :value => 'your_model_value_attr_if_different_from_value', 
                  :description => 'your_model_description_attr_if_description_from_email', 
                  :obs => 'your_model_obs_attr_if_different_from_obs'
```


How to?
------

In your controller:

```ruby
  payment_reference = @bill.create_payment_reference
  
  # check if success
  
  if payment_reference[:success]
  
  # access your payment_references easy
  
  @bill.payment_references

```


You can work response (configure your routes on easypay.rb)

```ruby
  Easypay::PaymentReference.find_by_ep_key(params[:ep_key])
```

Delete or update payment reference:

```ruby
  # delete payment reference
  @payment_reference.modify("delete")
  
  # update
  @payment_reference.modify("update")
```

Check Logs of every request and notification on table easypay_logs

Todo?
------

Feel free to contact me, you have your say.

I will put in github working project using gem


Copyright
------
Authors: Guilherme Pereira


