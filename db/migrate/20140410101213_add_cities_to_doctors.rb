class AddCitiesToDoctors < ActiveRecord::Migration
  def change
    add_column :cities, :doctors_count, :integer
    add_column :doctors, :city_id, :integer
  end
end
