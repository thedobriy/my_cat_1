class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :region_id
      t.integer :pop

      t.timestamps
    end
  end
end
