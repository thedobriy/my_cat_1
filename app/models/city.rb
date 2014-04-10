class City < ActiveRecord::Base
  has_one :company
  has_one :doctor
end
