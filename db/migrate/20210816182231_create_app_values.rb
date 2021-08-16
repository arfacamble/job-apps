class CreateAppValues < ActiveRecord::Migration[6.1]
  def change
    create_table :app_values do |t|
      t.references :application, null: false, foreign_key: true
      t.references :value, null: false, foreign_key: true

      t.timestamps
    end
  end
end
