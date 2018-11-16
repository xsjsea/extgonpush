class AddScheduleIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :schedule_id, :integer
  end
end
