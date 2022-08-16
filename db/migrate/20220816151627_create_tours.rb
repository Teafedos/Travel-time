class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :contry
      t.string :city
      t.integer :cost
      t.string :description

      t.timestamps
    end
  end
end
