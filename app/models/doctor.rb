class Doctor < ActiveRecord::Base
  belongs_to :company
  belongs_to :speciality, counter_cache: true
  belongs_to :city, counter_cache: true
  has_many :comments, as: :commentable

  validates :name, presence: true, length: { maximum: 60 }
  validates :speciality_id, presence: true
  validates :city_id, presence: true
  default_scope order('name ASC')
end
