class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :job_title
      t.string :company_name
      t.string :logo_url
      t.string :primary_color
      t.string :secondary_color
      t.string :background_color
      t.string :headers_font
      t.string :body_font

      t.timestamps
    end
  end
end
