json.array!(@listings) do |listing|
  json.extract! listing, :id, :q1, :q2, :q3, :user_id, :project_id
  json.url listing_url(listing, format: :json)
end
