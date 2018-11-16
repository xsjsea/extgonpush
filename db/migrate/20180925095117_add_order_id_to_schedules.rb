class AddOrderIdToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :order_id, :integer
  end
end
