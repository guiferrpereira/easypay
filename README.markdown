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

Check on your initializers folder for easypay.rb and change the parameters:

```ruby
  config.cin = 'CIN provided by Easypay' 
  config.user = 'USER provided by Easypay'
  config.entity = 'Entity provided by Easypay'
  config.code = 'Code is needed only if you don't have validation by IP Address (Configure on Easypay Backoffice)'
```

Usage
-----

Start Easypay call:

```ruby
  Easypay::Client.new
```

If you don't configure your easypay.rb with these params, you can start your object like this:

```ruby
  Easypay::Client.new(:easypay_cin => xxxx, 
                      :easypay_entity => xxxx, 
                      :easypay_user => xxxx, 
                      :easypay_code => xxxx, 
                      :easypay_ref_type => xxx, 
                      :easypay_country => xxxx)
```                      

In order to get one payment reference:

```ruby
  Easypay::Client.new.create_reference('token_you_generate', 'value_of_payment', 'client_language', 'client_name', 'client_mobile', 'client_email')
```

