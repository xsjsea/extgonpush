class AddProductselectedToCreatorExt < ActiveRecord::Migration[5.2]
  def change
    add_column :creator_exts, :productselected, :string
  end
end
