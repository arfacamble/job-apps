class CreateCoverParas < ActiveRecord::Migration[6.1]
  def change
    create_table :cover_paras do |t|
      t.string :text

      t.timestamps
    end
  end
end
