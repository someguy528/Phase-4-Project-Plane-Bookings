class CartSerializer < ActiveModel::Serializer
  # attributes :id, :buyer, :status
  attributes :id, :status, :buyer_id, :price_total
  has_many :cart_items, serializer: CartAllCartItemSerializer

  def price_total
    self.object.cart_items.sum{|i| i.quantity * i.product.price}
  end

end
