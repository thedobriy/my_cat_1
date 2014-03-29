class Doctor < ActiveRecord::Base
  before_save { self.name = name.capitalize }
  validates :name, presence: true, length: { maximum: 60 }
end
