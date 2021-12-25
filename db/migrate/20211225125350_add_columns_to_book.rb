class AddColumnsToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :price, :decimal, default: 19.7
    add_column :books, :sale, :boolean, default: false
  end
end
