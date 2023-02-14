class CartItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart
    
    validates :product_id, :cart_id, :quantity, presence: true
    validates :quantity, numericality: { greater_than: 0, less_than: 11 }
end
