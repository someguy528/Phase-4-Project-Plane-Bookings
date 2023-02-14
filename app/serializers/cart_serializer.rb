class CartSerializer < ActiveModel::Serializer
  # attributes :id, :buyer, :status
  attributes :id, :status, :price_total, :buyer_id
end
