class AddColumsToBookCollection < ActiveRecord::Migration[6.1]
  def change
    add_column :book_collections, :price, :decimal, default: 76
    add_column :book_collections, :sale, :boolean, default: false
  end
end
