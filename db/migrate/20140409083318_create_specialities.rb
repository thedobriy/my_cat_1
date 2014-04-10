class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.string :name
      t.integer :doctors_count

      t.timestamps
    end
  end
end
