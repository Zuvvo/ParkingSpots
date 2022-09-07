class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :book_time
      t.boolean :is_reserved

      t.timestamps
    end
  end
end
