class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :url
      t.string :string_id
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
