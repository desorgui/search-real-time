json.extract! search, :id, :search_query, :user_ip, :created_at, :updated_at
json.url search_url(search, format: :json)
