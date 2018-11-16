class CreateCreatorMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :creator_metrics do |t|
      t.integer :creator_id
      t.string :metric_id
      t.string :metric_name
      t.string :metric_value

      t.timestamps
    end
  end
end
