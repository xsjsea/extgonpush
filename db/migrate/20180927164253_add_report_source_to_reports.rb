class AddReportSourceToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :report_source, :string
  end
end
