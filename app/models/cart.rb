class Cart < ApplicationRecord
    belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
    has_many :cart_items, dependent: :destroy
    has_many :products, through: :cart_items

    validates :buyer_id, :status, presence: true
    def newCart
        self.create!({
            buyer_id: self.buyer_id,
            status: "open"
        })
    end
end
