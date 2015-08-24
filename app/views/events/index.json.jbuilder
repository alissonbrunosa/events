json.array!(@events) do |event|
  json.extract! event, :id, :title, :local, :date_start, :end_date
  json.description truncate(event.description, length: 450)
  json.created_at time_ago_in_words(event.created_at)
  json.date l(event.date_start, format: :when)
  json.url event_url(event, format: :json)
  json.photo event.photo.url(:medium)
end
