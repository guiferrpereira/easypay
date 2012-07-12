module Easypay
  class PaymentReference < ActiveRecord::Base
    self.table_name = 'easypay_payment_references'
    
    attr_protected
    
    def process(object)
      @object = object
      
      if compliant?
        self.update_attributes(handle_model_methods)
        
        payment_reference = Easypay::Client.new.create_reference(self)
        
        self.update_attributes( :ep_message => payment_reference[:ep_message],
                                :ep_reference => payment_reference[:ep_reference],
                                :ep_cin => payment_reference[:ep_cin],
                                :ep_user => payment_reference[:ep_user],
                                :ep_entity => payment_reference[:ep_entity],
                                :ep_link => payment_reference[:payment_link],
                                :ep_last_status => payment_reference[:ep_status],
                                :request_log => payment_reference[:raw])
                                
        return payment_reference
      else
        nil
      end
    end
    
    protected
    
    def handle_model_methods
      attributes = {}
      model_attributes.each do |attribute_name, method_name|
        if @object.respond_to? method_name
          attributes[attribute_name] = @object.send(method_name)
        elsif !attribute_name.to_s.match("ep_key").nil?
          attributes[attribute_name] = method_name
        end
      end
      return attributes
    end
    
    def model_attributes
      {
        :payable_id => @object.easypay_options[:payable_id],
        :ep_key => generate_ep_key,
        :ep_value => @object.easypay_options[:ep_value],
        :ep_language  => @object.easypay_options[:ep_language],
        :o_name  => @object.easypay_options[:o_name],
        :o_description  => @object.easypay_options[:o_description], 
        :o_obs => @object.easypay_options[:o_obs],
        :o_email => @object.easypay_options[:o_email],
        :o_mobile  => @object.easypay_options[:o_mobile]
      }
    end
    
    def compliant?
      !(@object.send(@object.easypay_options[:ep_language]).blank? && @object.send(@object.easypay_options[:ep_value]).blank?)
    end
    
    def generate_ep_key
      Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{@object.easypay_options[:ep_value]}--#{@object.easypay_options[:ep_language]}--")[8..32]
    end
  end
end