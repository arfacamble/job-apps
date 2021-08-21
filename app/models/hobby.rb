class Hobby < ApplicationRecord
  has_many :bulletpoints, as: :card, dependent: :destroy
end
