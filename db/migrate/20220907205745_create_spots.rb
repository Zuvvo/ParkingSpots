class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.datetime :book_time
      t.boolean :is_reserved
      t.string :user_mail

      t.timestamps
    end
  end
end
