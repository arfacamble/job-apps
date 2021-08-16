class CreateAppCompetencies < ActiveRecord::Migration[6.1]
  def change
    create_table :app_competencies do |t|
      t.references :application, null: false, foreign_key: true
      t.references :competency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
