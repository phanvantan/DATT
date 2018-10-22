json.extract! employee, :id, :name, :position, :address, :phone_number, :created_at, :updated_at
json.url employee_url(employee, format: :json)
