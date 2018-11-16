class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :tag_type
      t.string :tag_name

      t.timestamps
    end
  end
end
