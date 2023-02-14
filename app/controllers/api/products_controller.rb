class Api::ProductsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]


    def index 
        products = Product.all
        render json: products 
    end
end
