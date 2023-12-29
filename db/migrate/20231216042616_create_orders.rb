class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :status
      t.time :date_submitted
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :tax
      t.decimal :total

      t.timestamps  
    end
  end
end
