class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :product, :cart, :quantity
end
