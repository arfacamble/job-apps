class Hobby < ApplicationRecord
  has_many :bulletpoints, as: :card
end
