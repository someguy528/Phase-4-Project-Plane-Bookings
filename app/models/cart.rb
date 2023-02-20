class Cart < ApplicationRecord
    belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
    has_many :cart_items, dependent: :destroy
    has_many :products, through: :cart_items

    validates :buyer_id, :status, presence: true
    def self.new_cart(buyer_id:)
        self.create!({
            buyer_id: buyer_id,
            status: "open"
        })
    end
end
