json.array!(@events) do |event|
  json.extract! event, :id, :title, :local
  json.description truncate(event.description, length: 250)
  json.created_at time_ago_in_words(event.created_at)
  json.date l(event.date_time, format: :when)
  json.presences_count event.presences_count
  json.confirmed event.presences.where(user_id: current_user.id).exists? if current_user
  json.url event_url(event, format: :json)
  json.photo event.photo.url(:thumb)
end
