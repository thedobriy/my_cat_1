class Cabinet < ActiveRecord::Base
  belongs_to :company
  
  validates :name, presence: true, length: { maximum: 60 }
  validates :company_id, presence: true
  validates :city_id, presence: true
  default_scope order('name ASC')
 
end
