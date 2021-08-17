class AddFontLinkToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :font_link, :string
  end
end
