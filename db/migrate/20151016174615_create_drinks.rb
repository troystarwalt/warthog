class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :abv
      t.string :name

      t.timestamps null: false
    end
  end
end
