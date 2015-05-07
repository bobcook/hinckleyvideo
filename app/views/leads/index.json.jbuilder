json.array!(@leads) do |lead|
  json.extract! lead, :id, :first_name, :last_name, :address, :city, :state, :zip, :country, :phone, :email
  json.url lead_url(lead, format: :json)
end
