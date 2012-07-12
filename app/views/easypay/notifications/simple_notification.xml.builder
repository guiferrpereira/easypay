xml.instruct! :xml, :version => "1.0", :encoding => "ISO-8859-1"
xml.get_detail do
  if @payment_reference.nil?
    xml.ep_status "err"
    xml.ep_message "error mensage"
    xml.ep_entity @atts[:e] if @atts[:e].present?
    xml.ep_ref @atts[:r] if @atts[:r].present?
    xml.ep_value @atts[:v] if @atts[:v].present?
  else
    xml.ep_status "ok"
    xml.ep_message "success message"
    xml.ep_entity @payment_reference.ep_entity
    xml.ep_reference @payment_reference.ep_reference
    xml.ep_value @payment_reference.ep_value
    xml.t_key @payment_reference.ep_key
    
    xml.order_info do
      # xml.total_taxes " "
      xml.total_including_taxes @payment_reference.ep_value
      # TODO - Include this information in future
      # xml.bill_fiscal_number " "
      # xml.bill_name " "
      # xml.bill_address_1 " "
      # xml.bill_address_2 " "
      # xml.bill_city " "
      # xml.bill_zip_code " "
      # xml.bill_country " "
      #     
      # xml.ship_fiscal_number " "
      # xml.shipp_name " "
      # xml.shipp_address_1 " "
      # xml.shipp_address_2 " "
      # xml.shipp_city " "
      # xml.shipp_zip_code " "
      # xml.shipp_country " "
    end
    xml.order_detail do
      xml.item do
        xml.item_description @payment_reference.item_description
        xml.item_quantity @payment_reference.item_quantity
        xml.item_total @payment_reference.ep_value
      end
    end
  end
end