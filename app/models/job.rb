class Job < ApplicationRecord
  has_many :bulletpoints, as: :card, dependent: :destroy
  has_many :quotes, dependent: :destroy
end
