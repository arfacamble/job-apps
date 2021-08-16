class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.string :author
      t.string :text
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
