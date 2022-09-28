class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.datetime :book_time
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
