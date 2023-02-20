class Api::CartsController < ApplicationController

    def show 
        cart = @user.carts.find_by(status: "open")
        if !cart
            # cart = @user.carts.create!(new_cart_hash)
            cart = @user.carts.new_cart(buyer_id: @user.id)
        end
        render json: cart, include: ["cart_items" , "cart_items.product", "cart_items.product.seller"]
    end
    def destroy
        cart = @user.carts.find_by(id: params[:id])
        if cart.cart_items.length > 0 && cart.buyer_id == @user.id
            cart.destroy
            # @user.carts.create!(new_cart_hash)
            @user.carts.new_cart(buyer_id: @user.id)
            head :no_content
        else
            render json: {errors: ["Theres nothing in the Cart!"]}, status: :unauthorized
        end
    end

    private

    def new_cart_create
        params.permit(:status, :price_total)
    end
    # def new_cart_hash
    #     {buyer_id: @user.id, status: "open"}
    # end
end
