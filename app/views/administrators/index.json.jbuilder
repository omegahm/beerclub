json.array!(@administrators) do |administrator|
  json.extract! administrator, :username
  json.url user_url(administrator, format: :json)
end
