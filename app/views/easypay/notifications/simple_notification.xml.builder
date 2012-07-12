xml.instruct! :xml, :version => "1.0", :encoding => "ISO-8859-1"
xml.get_detail do
  if @payment_reference.nil?
    xml.ep_status "err"
    xml.ep_message "error mensage"
    xml.ep_entity "x1"
    xml.ep_ref "x2"
    xml.ep_value "x3"
  else
    xml.ep_status "ok"
    xml.ep_message "success message"
    xml.ep_entity @payment_reference.ep_entity
    xml.ep_reference @payment_reference.ep_reference
    xml.ep_value @payment_reference.ep_value
    xml.t_key @payment_reference.ep_key
    xml.order_info do
      xml.total_taxes "100.00"
      xml.total_including_taxes @payment_reference.ep_value
    
      xml.bill_fiscal_number "PT123456789"
      xml.bill_name "Billing Test Name"
      xml.bill_address_1 "Billing address line 1"
      xml.bill_address_2 "Billing address line 2"
      xml.bill_city "Billing city"
      xml.bill_zip_code "Billing zip code"
      xml.bill_country "Billing country"
    
      xml.ship_fiscal_number "PT123456789"
      xml.shipp_name "Shipping Test Name"
      xml.shipp_address_1 "Shipping address line 1"
      xml.shipp_address_2 "Shipping address line 2"
      xml.shipp_city "Shipping city"
      xml.shipp_zip_code "Shipping zip code"
      xml.shipp_country "Shipping coutry"
    end
    xml.order_detail do
      xml.item do
        xml.item_description "description of item 1"
        xml.item_quantity "5"
        xml.item_total @payment_reference.ep_value
      end
    end
  end
end