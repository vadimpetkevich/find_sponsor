json.array!(@investors) do |investor|
  json.extract! investor, :id, :first_name, :last_name, :branch, :location, :provide, :team_role
  json.url investor_url(investor, format: :json)
end
