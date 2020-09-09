json.extract! photo, :id, :name, :Album_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
