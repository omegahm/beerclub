json.array!(@meta) do |metum|
  json.extract! metum, :cash, :loss, :stock
  json.url metum_url(metum, format: :json)
end
