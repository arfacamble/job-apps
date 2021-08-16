class CreateValues < ActiveRecord::Migration[6.1]
  def change
    create_table :values do |t|
      t.string :title
      t.string :text
      t.string :image_url

      t.timestamps
    end
  end
end
