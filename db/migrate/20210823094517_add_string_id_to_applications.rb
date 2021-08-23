class AddStringIdToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :string_id, :string
  end
end
