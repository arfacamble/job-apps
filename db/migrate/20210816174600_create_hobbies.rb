class CreateHobbies < ActiveRecord::Migration[6.1]
  def change
    create_table :hobbies do |t|
      t.string :string_id
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
