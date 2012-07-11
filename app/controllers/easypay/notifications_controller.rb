module Easypay
  class NotificationsController < ApplicationController
    
    unloadable
    
    before_filter :register_notification
  
    def simple_notification
      # c=PT&e=10611&r=810302231&v=7&l=PT&t_key=
      payment_reference = PaymentReference.find_by_ep_reference_and_ep_value(params[:e], params[:v])
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
      if params[:s].starts_with? "ok" and params[:k].present?
        r_payment = Easypay::Client.new.request_payment(params[:e], params[:r], params[:v], params[:k])
        unless r_payment[:s].starts_with? "ok"
          #quando falha o pagamento
        end
      else
        #quando falha a autorizacao do cartao
      end
      
      redirect_to payment_redirect_url(:status => params[:s], :ep_key => params[:t_key])
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