class AddColumnConfirmationToEventDetails < ActiveRecord::Migration
  def change
    add_column :event_details, :status, :integer
  end
end
