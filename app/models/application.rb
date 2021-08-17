class Application < ApplicationRecord
  has_many :app_competencies
  has_many :competencies, through: :app_competecies
  has_many :app_cover_paras
  has_many :cover_paras, through: :app_cover_paras
end
