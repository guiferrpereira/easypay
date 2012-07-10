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
  end
end