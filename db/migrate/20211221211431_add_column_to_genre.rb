class AddColumnToGenre < ActiveRecord::Migration[6.1]
  def change
    add_index :genres, :title, unique: true
  end
end
