class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.string :flow_type
      t.string :flow_name
      t.integer :flow_order

      t.timestamps
    end
  end
end
