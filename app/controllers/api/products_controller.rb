class Api::ProductsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]
        def create
            product = @user.products.create!(product_params)
            render json: product, status: :created
        end
        def index 
            products = Product.all
            render json: products 
        end
        def show
            product = Product.find(params[:id])
            render json: product
        end
        def update
            product = @user.products.find(params[:id])
            product.update!(product_update_params)
            render json: product
        end

        def destroy 
            product = @user.products.find(params[:id])
            unless CartItem.find_by(product_id: params[:id])
                product.destroy
                head :no_content
            else 
                render json: {errors: ["Product exists in someone's cart!"]}, status: :unauthorized
            end
        end
        private
        def product_params
            params.permit(:name, :description, :price, :available)
        end
        def product_update_params
            params.permit(:name, :description, :price, :available)
        end
    
    end
    
    # if params[:user_id]
        # products = @user.products
        # render json: products