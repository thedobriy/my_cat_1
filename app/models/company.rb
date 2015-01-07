class Company < ActiveRecord::Base
  has_many :doctors
  has_many :company_types
  has_many :comments, as: :commentable

  belongs_to :city, counter_cache: true
  belongs_to :main_doctor, :class_name => 'Doctor'
  validates :name, presence: true, length: { maximum: 100 }
  validates :city_id, presence: true
  # scope :kolvo, ->(city_id) { where("city_id = ?", city_id) }
end
