class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model
      t.string :year
      t.integer :mileage
      t.references :dealer, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
