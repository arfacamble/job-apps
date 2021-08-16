class CreateAppCoverParas < ActiveRecord::Migration[6.1]
  def change
    create_table :app_cover_paras do |t|
      t.references :application, null: false, foreign_key: true
      t.references :cover_para, null: false, foreign_key: true

      t.timestamps
    end
  end
end
