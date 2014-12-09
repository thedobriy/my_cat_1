class AddCityToCabinet < ActiveRecord::Migration
  def change
    add_column :cities, :cabinets_count, :integer
    add_column :cabinets, :city_id, :integer
  end
end
