class AddGenreRefToBook < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :genre, null: false, foreign_key: true
  end
end
