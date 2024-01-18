json.extract! user, :id, :email, :zip_code, :created_at, :updated_at
json.url user_url(user, format: :json)
