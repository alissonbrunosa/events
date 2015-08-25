class RemoveColumnPresencesCount < ActiveRecord::Migration
  def change
  	remove_column :events, :presences_count
  end
end
