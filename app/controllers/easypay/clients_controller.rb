module Easypay
  class ClientsController < ApplicationController
    
    unloadable
  
    def notify
      @atts = params
    
      @atts[:ep_entity] = params[:e]
      @atts[:ep_reference] = params[:r]
      @atts[:ep_value] = params[:v]
    
      respond_to do |format|
        format.xml #{ render :xml => render_to_string(:template => 'easypay/notify.xml.builder', :layout => false), :content_type => 'plain/text'}
      end
    end
  end
end