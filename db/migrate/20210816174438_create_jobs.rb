class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :string_id
      t.string :institution
      t.string :job_title
      t.string :date_range
      t.string :image_url
      t.string :text
      t.date :start_date

      t.timestamps
    end
  end
end
