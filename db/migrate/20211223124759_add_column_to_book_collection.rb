class AddColumnToBookCollection < ActiveRecord::Migration[6.1]
  def change
    add_index :book_collections, :title, unique: true
  end
end
