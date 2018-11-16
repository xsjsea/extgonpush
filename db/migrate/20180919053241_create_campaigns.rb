class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :description
      t.date :start
      t.float :budget

      t.timestamps
    end
  end
end
