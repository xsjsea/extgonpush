class AddInviterequiredToCreatorExt < ActiveRecord::Migration[5.2]
  def change
    add_column :creator_exts, :inviterequired, :string
  end
end
