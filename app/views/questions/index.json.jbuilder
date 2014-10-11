json.array!(@questions) do |question|
  json.extract! question, :id, :text, :karma
  json.url question_url(question, format: :json)
end
