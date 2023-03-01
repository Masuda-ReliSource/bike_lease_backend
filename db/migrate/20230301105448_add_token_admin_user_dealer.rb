class AddTokenAdminUserDealer < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_users, :auth_token, :string
    add_column :dealers, :auth_token, :string
  end
end
