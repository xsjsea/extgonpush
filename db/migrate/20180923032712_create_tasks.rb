class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.date :due_date
      t.boolean :complete

      t.timestamps
    end
  end
end
