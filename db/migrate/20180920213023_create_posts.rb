class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :post_author
      t.string :post_date
      t.string :post_title
      t.string :post_content
      t.string :post_status
      t.datetime :post_modified
      t.string :post_type

      t.timestamps
    end
  end
end
