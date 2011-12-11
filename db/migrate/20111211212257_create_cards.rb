class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.string :folder_name

      t.timestamps
    end
  end
end
