class City < ActiveRecord::Base
  has_one :company
end
