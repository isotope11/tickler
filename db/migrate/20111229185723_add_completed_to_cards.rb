class AddCompletedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :completed, :boolean
  end
end
