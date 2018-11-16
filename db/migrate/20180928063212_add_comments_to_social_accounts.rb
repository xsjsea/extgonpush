class AddCommentsToSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :social_accounts, :comments, :integer
  end
end
