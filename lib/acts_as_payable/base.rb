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
          has_many :payment_references,  :class_name => 'Easypay::PaymentReference', :conditions => ["payable_type = '#{self.name.to_s}'"], :foreign_key => "payable_id"
          
          define_method "easypay_options" do 
            { 
              :payable_id => args[:id] || "id",
              :ep_value => args[:value] || "value",
              :ep_language  => args[:language] || "language",
              :o_name  => args[:name] || "name",
              :o_description  => args[:description] || "description", 
              :o_obs => args[:obs] || "obs",
              :o_email => args[:email] || "email",
              :o_mobile => args[:mobile] || "mobile",
              :item_description => args[:item_description] || "item_description",
              :item_quantity => args[:item_quantity] || "item_quantity"
            } 
          end
          
          include Easypay::ActsAsPayable::Base::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        def create_payment_reference(options={})
          Easypay::PaymentReference.new.process(self, options)
        end
                
      end # InstanceMethods
    end

  end
end

::ActiveRecord::Base.send :include, Easypay::ActsAsPayable::Base