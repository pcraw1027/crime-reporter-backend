class CreateArrests < ActiveRecord::Migration[6.1]
  def change
    create_table :arrests do |t|
      t.references :state, null: false, foreign_key: true
      t.references :crime, null: false, foreign_key: true
      t.integer :total_arrests
      t.integer :male_arrests
      t.integer :female_arrests
      t.integer :year

      t.timestamps
    end
  end
end
