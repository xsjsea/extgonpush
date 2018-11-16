class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :campaign_id
      t.integer :marketer_id
      t.float :budget
      t.datetime :start_date
      t.string :description

      t.timestamps
    end
  end
end
