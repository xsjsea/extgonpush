class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.integer :creator_id
      t.integer :marketer_id
      t.integer :campaigns_id
      t.float :contract_price
      t.datetime :down_payment_date
      t.float :down_payment
      t.datetime :rest_payment_date
      t.float :rest_payment
      t.string :contract_image
      t.string :comment

      t.timestamps
    end
  end
end
