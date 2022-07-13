class CreateOrderLines < ActiveRecord::Migration[5.0]
    def change
      create_table :order_lines do |t|
        t.belongs_to :order
        t.string :item_name
        t.integer :quantity
        t.timestamps
      end
    end
  end
  