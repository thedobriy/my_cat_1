class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|
      t.string :name
      t.integer :company_id
      t.string :adress
      t.string :desc
      t.string :shedule

      t.timestamps
    end
    add_index :cabinets, [:name, :company_id]
  end
end
