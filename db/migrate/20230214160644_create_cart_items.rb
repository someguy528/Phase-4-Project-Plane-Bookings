class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.string :product
      t.string :cart
      t.integer :quantity

      t.timestamps
    end
  end
end
