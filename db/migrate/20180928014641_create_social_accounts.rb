class CreateSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :social_accounts do |t|
      t.integer :creator_id
      t.integer :channel_id
      t.string :channel_name
      t.string :channel_value

      t.timestamps
    end
  end
end
