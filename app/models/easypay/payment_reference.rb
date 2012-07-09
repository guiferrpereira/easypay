module Easypay
  class PaymentReference < ActiveRecord::Base
    self.table_name = 'easypay_payment_references'
    
    attr_accessible :ep_language, :o_name, :o_description, :o_email, :o_mobile, :ep_value
    
    before_create :generate_ep_key
    
    def generate_ep_key
      self.ep_key = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{self.created_at}--")[8..32]
    end
    
  end
end