class Bulletpoint < ApplicationRecord
  belongs_to :card, polymorphic: true
end
