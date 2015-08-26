class AddPhotoProcessingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :photo_processing, :boolean
  end
end
