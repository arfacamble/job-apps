class Job < ApplicationRecord
  has_many :bulletpoints, as: :card
  has_many :quotes
end
