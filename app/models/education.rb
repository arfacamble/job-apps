class Education < ApplicationRecord
  has_many :bulletpoints, as: :card
end
