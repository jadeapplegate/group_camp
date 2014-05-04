json.array!(@trips) do |trip|
  json.extract! trip, :id, :arrival, :departure, :camp_info, :share_url
  json.url trip_url(trip, format: :json)
end
