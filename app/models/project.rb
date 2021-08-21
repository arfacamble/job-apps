class Project < ApplicationRecord
  has_many :bulletpoints, as: :card, dependent: :destroy
end
