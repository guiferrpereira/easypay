module Easypay
  class PaymentReference < ActiveRecord::Base
    self.table_name = 'easypay_payment_references'
    
    attr_accessible :ep_language, :o_name, :o_description, :o_email, :o_mobile, :ep_value
    
    before_create :generate_ep_key
    
    def generate_ep_key
      self.ep_key = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{self.created_at}--")[8..32]
    end
    
    # def create_reference
      # ep = Easypay::Client.new.create_reference(self.ep_key, 7, 'pt', 'Coca Cola', '919998822', 'guiferrpereira@gmail.pt')
    # end
    
  end
end