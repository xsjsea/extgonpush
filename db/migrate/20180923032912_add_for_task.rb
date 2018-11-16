class AddForTask < ActiveRecord::Migration[5.2]
  def change
  	add_column :tasks,:testAdd,:string
  end
end
