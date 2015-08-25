class AddPresencesCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :presences_count, :integer, default: 0
    Event.all.each do |event|
    	Event.reset_counters(event.id, :presences)
    end
  end
end
