class AddPriorityToNota < ActiveRecord::Migration[8.0]
  def up
    add_column :notes, :priority, :string
  end

  def down
    remove_column :notes, :priority
  end
end
