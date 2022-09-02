class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :contry
      t.string :city
      t.integer :cost
      t.integer :hotel_lux
      t.integer :hotel_standart
      t.integer :hotel_budget
      t.integer :cost_eat
      t.integer :transfer
      t.integer :excursion
      t.string :description
      t.integer :insales_id

      t.timestamps
    end
  end
end
