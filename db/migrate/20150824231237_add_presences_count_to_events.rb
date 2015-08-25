class AddPresencesCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :presences_count, :integer
  end
end
