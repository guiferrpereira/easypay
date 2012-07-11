module Easypay
  module ActsAsPayable

    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def acts_as_payable args = {}
          has_many :payment_references,  :class_name => 'Easypay::PaymentReference', :foreign_key => "payable_id"
          
          define_method "easypay_options" do 
            { 
              :ep_value => args[:value] || "value",
              :ep_language  => args[:language] || "language",
              :o_name  => args[:name] || "name",
              :o_description  => args[:description] || "description", 
              :o_obs => args[:obs] || "obs",
              :o_email => args[:email] || "email",
              :o_mobile  => args[:mobile] || "mobile"
            } 
          end
          
          include Easypay::ActsAsPayable::Base::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        def create_reference
        
        end
        
        def factory_name
          self.send(self.easypay_options[:ep_language])
        end
        
        def payment_info
          # method that retrieves payment_reference_info
        end
                
      end # InstanceMethods
    end

  end
end

::ActiveRecord::Base.send :include, Easypay::ActsAsPayable::Base