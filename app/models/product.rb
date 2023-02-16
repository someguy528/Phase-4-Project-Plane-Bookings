class Product < ApplicationRecord
    belongs_to :seller, class_name: 'User', foreign_key: :seller_id
    has_many :cart_items
    has_many :carts, through: :cart_items 
    has_many :buyers, through: :carts

    validates :seller_id, :name, :description, :price, presence: true
    validates :name, length: {in: 4..30}, format: {with: /\A[a-zA-Z\d]+([:]{0,1}[ \-]{1}[a-zA-Z\d]+)*\z/}, uniqueness: {scope: :name}
    validates :description, length: {in: 5..50}, format: {with: /\A[a-zA-Z\d]+(([:\,]{0,1}[ \-]{1}[a-zA-Z\d]+)*[.!\?]{0,1})*\z/}
    validates :price,  numericality: { greater_than: 0.00, less_than: 200.00 }, format: {with: /\A[\d]+(([\.]{1}[\d]{1,2})|([\.]{0}))\z/}
end