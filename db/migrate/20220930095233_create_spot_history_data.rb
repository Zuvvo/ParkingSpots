class CreateSpotHistoryData < ActiveRecord::Migration[7.0]
  def change
    create_table :spot_history_data do |t|
      t.belongs_to :spot, null: false, foreign_key: true
      t.integer :reservation_time
      t.string :user_nickname
      t.integer :action

      t.timestamps
    end
  end
end
