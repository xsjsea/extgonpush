class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :status
      t.string :usertype
      t.string :username
      t.string :truename
      t.string :password
      t.integer :province_id
      t.integer :city_id
      t.integer :distirct_id
      t.string :address
      t.string :user_comment

      t.timestamps
    end
  end
end
