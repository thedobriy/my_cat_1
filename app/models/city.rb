class City < ActiveRecord::Base
  has_one :company
  has_one :doctor
  has_one :cabinet
end
