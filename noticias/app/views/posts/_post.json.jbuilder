json.extract! post, :id, :titulo, :bajada, :cuerpo, :fecha, :created_at, :updated_at
json.url post_url(post, format: :json)
