class CartSerializer < ActiveModel::Serializer
  attributes :id, :buyer, :status
end
