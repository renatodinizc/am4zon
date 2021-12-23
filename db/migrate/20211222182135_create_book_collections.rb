class CreateBookCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :book_collections do |t|
      t.string :title
      t.string :description
      t.references :book1
      t.references :book2
      t.references :book3
      t.references :book4
      t.references :book5
      t.references :book6
      t.references :book7

      t.timestamps
    end
  end
end
