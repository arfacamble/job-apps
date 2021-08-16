class Project < ApplicationRecord
  has_many :bulletpoints, as: :card
end
