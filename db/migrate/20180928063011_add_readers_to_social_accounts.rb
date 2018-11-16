class AddReadersToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :readers, :integer
  end
end
