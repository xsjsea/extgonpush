class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :service_description
      t.float :service_price
      t.integer :creator_id

      t.timestamps
    end
  end
end
