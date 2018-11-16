class AddReportLinkToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :report_link, :string
  end
end
