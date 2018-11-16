class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.integer :case_author
      t.string :case_date
      t.string :case_title
      t.string :case_content
      t.string :case_status
      t.datetime :case_modified
      t.string :case_type

      t.timestamps
    end
  end
end
