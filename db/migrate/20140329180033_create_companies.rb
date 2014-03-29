class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string  :name
      t.string  :desc
      t.string  :adress
      t.string  :contacts
      t.string  :site
      t.integer :type_company_id
      t.integer :main_doctor_id
      t.integer :city_id

      t.timestamps
    end
  end
end
