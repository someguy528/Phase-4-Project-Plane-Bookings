class Api::CartItemsController < ApplicationController
    def create
        cart = @user.carts.find_by(status: "open")
        cart_item = cart.cart_items.find_by(product_id: params[:product_id])
        unless cart_item
            cart_item = cart.cart_items.create!(cart_item_params)
            render json: cart_item, status: :created, include: ["product" , "product.seller"]
        else
            unless cart_item[:quantity] + params[:quantity] > 10
                cart_item.update!(quantity: cart_item[:quantity] + params[:quantity])
                render json: cart_item, include: ["product" , "product.seller"]
            else
                render json: {errors: ["Quantity can't exceed 10 in cart!"]}, status: :unauthorized
            end
        end
    end
    def update
        cart_item = find_cart_item
        if cart_item.quantity != params[:quantity]
            cart_item.update!(cart_item_update_params)
            render json: cart_item, include: ["product" , "product.seller"]
        else
            render json: {errors: ["Quantity did not change!"]}, status: :unauthorized
        end
    end

    def destroy
        cart_item = find_cart_item
        if cart_item
            cart_item.destroy
            head :no_content
        else
            render json: {errors: ["Cart Item Not Found!"]}, status: :not_found
        end
    end

    private
    
    def cart_item_params
        params.permit(:product_id, :quantity)
    end
    def cart_item_update_params
        params.permit(:quantity)
    end
    def find_cart_item
        @user.cart_items.find_by(id: params[:id])
    end
end
