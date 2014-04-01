class Company < ActiveRecord::Base
  has_many :doctors
  belongs_to :main_doctor, :class_name => 'Doctor'
  validates :name, presence: true, length: { maximum: 60 }
end
