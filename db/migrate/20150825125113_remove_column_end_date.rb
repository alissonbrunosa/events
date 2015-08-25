class RemoveColumnEndDate < ActiveRecord::Migration
  def change
  	remove_column :events, :end_date
  end
end
