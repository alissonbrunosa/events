json.array!(@events) do |event|
  json.extract! event, :id, :title, :local
  json.description truncate(event.description, length: 450)
  json.created_at time_ago_in_words(event.created_at)
  json.date l(event.date_time, format: :when)
  json.confirm_count event.event_confirm_count
  json.unconfirm_count event.event_unconfirm_count
  json.status event.event_details.where(user_id: current_user.id).first.try :status if current_user
  json.photo event.photo.url(:medium)
end
