module Easypay
  class NotificationsController < ApplicationController
    
    unloadable
    
    before_filter :register_notification
  
    def simple_notification
      # c=PT&e=10611&r=810302231&v=7&l=PT&t_key=
      @atts = params
    
      @atts[:ep_entity] = params[:e]
      @atts[:ep_reference] = params[:r]
      @atts[:ep_value] = params[:v]
      
      respond_to do |format|
        format.xml
      end
    end
    
    def notification_to_forward
      # e=10611&r=810302231&v=7&s=ok&k=C36D4995CBF3574ADD8664BA26514181C9EA8737&t_key=CCCSOKCSO
      # Update a PaymentReference
      
      if params[:s].starts_with? "ok" and params[:k].present?
        # params[:e] # params[:r] # params[:v] # params[:s] # params[:k] # params[:t_key] # sucesso no pagamento
        r_payment = Easypay::Client.new.request_payment(params[:r], params[:v], params[:k])
      end
      
      logger.debug params[:s]
      
      redirect_to Easypay::Engine.config.redirect_after_payment_path#, :status => params[:s], :key => params[:t_key])
    end
    
    def notification_from_mb_payment
      
      # params = "ep_cin=8103&ep_user=OUTITUDE&ep_doc=EASYTEST28083120120709182740"
      
      respond_to do |format|
        format.xml
      end
    end
    
    private
    
    def register_notification
      Easypay::Log.create(:request_type => "Notification", :request_url => request.fullpath, :request_remote_ip => request.remote_ip)
    end
  end
end