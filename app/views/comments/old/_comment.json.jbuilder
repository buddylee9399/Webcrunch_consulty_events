json.extract! comment, :id, :reply, :meeting_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
