class CartItemSerializer < ActiveModel::Serializer

  # attributes :id, :product, :cart, :quantity
  attributes :id, :quantity, :product_id, :cart_id
  belongs_to :product
  belongs_to :cart
end
