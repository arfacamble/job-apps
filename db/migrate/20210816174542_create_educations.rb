class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.string :string_id
      t.string :institution
      t.string :title
      t.string :date_range
      t.string :image_url
      t.date :start_date

      t.timestamps
    end
  end
end
