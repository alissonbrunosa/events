class RenameModelPresencesToEventDetails < ActiveRecord::Migration
  def change
  	rename_table :presences, :event_details
  end
end
