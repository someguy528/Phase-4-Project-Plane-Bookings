class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :buyer, null: false, foreign_key: {to_table: :users}
      t.string :status

      t.timestamps
    end
  end
end
