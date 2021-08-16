class CreateBulletpoints < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletpoints do |t|
      t.string :text
      t.references :card, polymorphic: true

      t.timestamps
    end
  end
end
