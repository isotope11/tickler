class AddIndicesToCards < ActiveRecord::Migration
  def change
    add_index :cards, :folder_name
  end
end
