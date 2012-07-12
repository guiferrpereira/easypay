class CreateEasypayTables < ActiveRecord::Migration
  def self.up
    create_table :easypay_payment_references, :force => true do |t|
      t.integer   :payable_id
      t.string    :ep_key
      t.string    :ep_doc
      t.string    :ep_cin
      t.string    :ep_user
      t.string    :ep_language
      t.timestamp :ep_date
      t.string    :ep_status, :default => 'pending'
      t.string    :ep_entity
      t.string    :ep_reference
      t.decimal   :ep_value
      t.string    :ep_payment_type
      t.decimal   :ep_value_fixed,  :precision => 16, :scale => 2
      t.decimal   :ep_value_var,  :precision => 16, :scale => 2
      t.decimal   :ep_value_tax,  :precision => 16, :scale => 2
      t.decimal   :ep_value_transf, :precision => 16, :scale => 2
      t.timestamp :ep_date_transf
      t.timestamp :ep_date_read
      t.string    :ep_status_read
      t.string    :ep_invoice_number
      t.string    :ep_transf_number
      t.text      :ep_message
      t.text      :request_log
      t.string    :ep_last_status
      t.text      :ep_link
      
      t.string    :o_key
      t.string    :o_name
      t.string    :o_description
      t.text      :o_obs
      t.string    :o_email
      t.string    :o_mobile
      t.string    :item_description
      t.integer   :item_quantity
      
      t.timestamps
    end
    
    create_table :easypay_logs, :force => true do |t|
      t.string :request_type
      t.string :request_remote_ip
      t.text :request_url
      t.text :raw
      
      t.timestamps
    end
    
    add_index :easypay_payment_references, :payable_id
    add_index :easypay_payment_references, :ep_key, :unique => true
    add_index :easypay_payment_references, :ep_doc, :unique => true
  end

  def self.down
    drop_table :easypay_payment_references
    drop_table :easypay_requests
  end
end