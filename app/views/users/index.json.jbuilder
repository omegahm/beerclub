json.array!(@users) do |user|
  json.extract! user, :name, :room
  json.url user_url(user, format: :json)
end
