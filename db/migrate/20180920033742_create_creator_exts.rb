class CreateCreatorExts < ActiveRecord::Migration[5.2]
  def change
    create_table :creator_exts do |t|
      t.integer :userid
      t.string :tags_set
      t.string :avatar
      t.integer :category_id

      t.timestamps
    end
  end
end
