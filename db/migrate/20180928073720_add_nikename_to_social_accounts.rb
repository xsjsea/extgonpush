class AddNikenameToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :nickname, :string
  end
end
