class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.string :buyer
      t.string :status

      t.timestamps
    end
  end
end
