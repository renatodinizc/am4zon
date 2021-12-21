class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birth_date, :date
    add_column :users, :occupation, :string
    add_column :users, :citizenship, :string
    add_column :users, :description, :string
  end
end
