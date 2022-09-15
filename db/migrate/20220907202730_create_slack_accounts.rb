class CreateSlackAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_accounts do |t|
      t.string :username
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end