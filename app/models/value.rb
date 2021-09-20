class Value < ApplicationRecord
  has_many :app_values, dependent: :destroy
end
