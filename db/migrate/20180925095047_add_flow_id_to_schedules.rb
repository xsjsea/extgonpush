class AddFlowIdToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :flow_id, :integer
  end
end
