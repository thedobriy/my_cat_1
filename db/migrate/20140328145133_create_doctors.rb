class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string  :name
      t.string  :desc
      t.string  :contacts
      t.integer :company_id
      t.integer :speciality_id
      t.timestamps
    end
    add_index :doctors, [:name, :company_id, :speciality_id]
  end
end
