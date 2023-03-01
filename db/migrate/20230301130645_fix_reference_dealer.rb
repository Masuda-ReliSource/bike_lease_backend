class FixReferenceDealer < ActiveRecord::Migration[7.0]
  def change
    remove_reference :dealers, :admin_users, foreign_key: true, null: false
    add_reference :dealers, :admin_user, foreign_key: true, null: false, index: true
  end
end
