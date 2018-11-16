class AddFansToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :fans, :integer
  end
end
