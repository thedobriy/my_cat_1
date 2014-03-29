class Company < ActiveRecord::Base
  has_many :doctors
  belongs_to :doctor, foreign_key: :main_doctor_id
end
