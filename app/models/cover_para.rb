class CoverPara < ApplicationRecord
  has_many :app_cover_paras, dependent: :destroy
  has_many :applications, through: :app_cover_paras
end
