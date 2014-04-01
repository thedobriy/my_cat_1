class Company < ActiveRecord::Base
  has_many :doctors
  belongs_to :main_doctor, :class_name => 'Doctor'
end
