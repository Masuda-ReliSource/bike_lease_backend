class CreateDealers < ActiveRecord::Migration[7.0]
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.integer :status
      t.references :admin_users, foreign_key: true, null: false
      t.timestamps
    end
  end
end
