json.extract! user, :id, :uid, :email, :first_name, :last_name, :picture, :balance, :created_at, :updated_at
json.url user_url(user, format: :json)
