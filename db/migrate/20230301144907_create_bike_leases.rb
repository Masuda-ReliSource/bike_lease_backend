class CreateBikeLeases < ActiveRecord::Migration[7.0]
  def change
    create_table :bike_leases do |t|
      t.json :leese, default: {}
      t.json :closee, default: {}
      t.decimal :down_payment, default: 0, precision: 12, scale: 2
      t.integer :lease_status, default: 0
      t.datetime :approved_at
      t.references :bike, foreign_key: true, null: false, index: true
      t.references :dealer, foreign_key: true, null: false, index: true
      t.references :admin_user, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
