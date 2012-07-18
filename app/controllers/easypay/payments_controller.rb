module Easypay
  class PaymentsController < ApplicationController
    def complete
      # After payment success
      @key = params[:ep_key]
      @status = params[:status]
      respond_to do |format|
        format.html
      end
    end
    
    def notify
      # After payment success
      @payment_reference = PaymentReference.find_by_payable_id(params[:payable_id])
      
      respond_to do |format|
        format.html
      end
    end
  end
end