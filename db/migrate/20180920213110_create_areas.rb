class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :areaName
      t.integer :area_level
      t.integer :area_sequence
      t.integer :parent_id

      t.timestamps
    end
  end
end
