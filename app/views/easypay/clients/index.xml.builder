xml.instruct! :xml, :version => "1.0", :encoding => "ISO-8859-1"
xml.get_detail do
  xml.ep_status "ok0"
  xml.ep_message " "
  xml.ep_entity @atts[:ep_entity]
  xml.ep_reference @atts[:ep_reference]
  xml.ep_value @atts[:ep_value]
  xml.ep_key 12345
  xml.ep_d( :PT => "" , :EN => "" , :ES => "" , :v => "" )
end