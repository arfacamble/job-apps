class AddPasskeyToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :passkey, :string
  end
end
