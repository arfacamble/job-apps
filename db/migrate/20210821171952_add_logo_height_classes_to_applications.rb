class AddLogoHeightClassesToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :logo_height_classes, :string
  end
end
