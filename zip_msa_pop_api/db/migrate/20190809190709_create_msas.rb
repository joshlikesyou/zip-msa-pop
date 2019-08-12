class CreateMsas < ActiveRecord::Migration[6.0]
  def change
    create_table :msas do |t|
      t.integer :cbsa
      t.integer :mdiv
      t.string :name
      t.string :lsad
      t.integer :pop_estimate_2014
      t.integer :pop_estimate_2015

      t.timestamps
    end
  end
end
