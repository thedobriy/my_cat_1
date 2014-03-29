class Doctor < ActiveRecord::Base
  belongs_to :company
  validates :name, presence: true, length: { maximum: 60 }
end
