class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :local
      t.datetime :date_start
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
