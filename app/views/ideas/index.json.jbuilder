json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :description, :branch, :location, :team, :plans, :demands, :businessman_id
  json.url idea_url(idea, format: :json)
end
