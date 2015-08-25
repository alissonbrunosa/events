class AddCounterCacheColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_confirm_count, :integer
    add_column :events, :event_unconfirm_count, :integer
  end
end
