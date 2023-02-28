class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.integer :status
      t.integer :role_type
      t.bigint :created_by
      t.timestamps
    end
  end
end
