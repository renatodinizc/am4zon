class ChangeColumnFromAuthor < ActiveRecord::Migration[6.1]
  def change
    rename_column :authors, :nationality, :citizenship
  end
end
