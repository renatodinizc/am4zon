class AddBookCollectionRefToBook < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :book_collection
  end
end
