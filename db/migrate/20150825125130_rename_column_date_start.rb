class RenameColumnDateStart < ActiveRecord::Migration
  def change
  	rename_column :events, :date_start, :date_time
  end
end
