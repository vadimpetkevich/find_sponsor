json.array!(@businessmen) do |businessman|
  json.extract! businessman, :id, :first_name, :last_name
  json.url businessman_url(businessman, format: :json)
end
