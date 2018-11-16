class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :campaign_id
      t.integer :flow_name
      t.integer :flow_order
      t.datetime :starts_on
      t.datetime :ends_on
      t.integer :workdays
      t.integer :status
      t.integer :post_id

      t.timestamps
    end
  end
end
