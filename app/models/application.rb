class Application < ApplicationRecord
  has_many :app_competencies, dependent: :destroy
  has_many :competencies, through: :app_competencies
  has_many :app_cover_paras, dependent: :destroy
  has_many :cover_paras, through: :app_cover_paras
  has_many :app_values, dependent: :destroy
  has_many :values, through: :app_values
end
