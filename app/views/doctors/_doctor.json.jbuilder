json.extract! doctor, :id, :name, :date_registered, :service_type, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
