class RemoveForeignKeyFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :books, column: :supplier_id
    remove_foreign_key :books, column: :author_id
  end
end
