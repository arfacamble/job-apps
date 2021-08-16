class CreateNavTabs < ActiveRecord::Migration[6.1]
  def change
    create_table :nav_tabs do |t|
      t.string :title
      t.string :icon_name

      t.timestamps
    end
  end
end
