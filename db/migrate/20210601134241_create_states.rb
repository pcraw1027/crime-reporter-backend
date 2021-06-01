class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :abbreviation
      t.string :name
      t.integer :population
      t.integer :female_population
      t.integer :male_population

      t.timestamps
    end
  end
end
