class AddStatusToNote < ActiveRecord::Migration[8.0]
  def up
    add_column :notes, :status, :string
  end

  def down
    remove_column :notes, :status
  end
end
