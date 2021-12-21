class AddColumnToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_index :authors, :name, unique: true
  end
end
