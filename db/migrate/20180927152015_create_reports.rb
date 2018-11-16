class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :report_author
      t.string :report_date
      t.string :report_title
      t.string :report_content
      t.string :report_status
      t.datetime :post_modified
      t.string :report_type

      t.timestamps
    end
  end
end
