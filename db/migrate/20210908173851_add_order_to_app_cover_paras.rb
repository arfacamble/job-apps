class AddOrderToAppCoverParas < ActiveRecord::Migration[6.1]
  def change
    add_column :app_cover_paras, :order, :integer
  end
end
