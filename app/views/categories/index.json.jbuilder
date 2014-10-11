json.array!(@categories) do |category|
  json.extract! category, :id, :type, :assignment
  json.url category_url(category, format: :json)
end
