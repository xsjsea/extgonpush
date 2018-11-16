class AddPraisesToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :praises, :integer
  end
end
