class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :tour, null: false, foreign_key: true
      t.integer :insales_order
      t.string :email
      t.string :name
      t.integer :quantity
      t.integer :days
      t.string :trans
      t.string :hotel
      t.string :eat
      t.integer :room_two
      t.integer :rooms_three
      t.integer :rooms_four
      t.string :excursion

      t.timestamps
    end
  end
end
