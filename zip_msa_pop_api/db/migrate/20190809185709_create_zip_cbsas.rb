class CreateZipCbsas < ActiveRecord::Migration[6.0]
  def change
    create_table :zip_cbsas do |t|
      t.integer :zip
      t.integer :cbsa

      t.timestamps
    end

    add_index :zip_cbsas, :zip
    add_index :zip_cbsas, :cbsa
  end
end
