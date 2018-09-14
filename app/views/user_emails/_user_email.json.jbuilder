json.extract! user_email, :id, :name, :email, :login, :created_at, :updated_at
json.url user_email_url(user_email, format: :json)