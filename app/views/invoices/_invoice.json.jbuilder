json.extract! invoice, :id, :from_full_name, :from_address, :from_email, :from_phone, :to_full_name, :to_address, :to_email, :to_phone, :status, :discount, :vat, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
