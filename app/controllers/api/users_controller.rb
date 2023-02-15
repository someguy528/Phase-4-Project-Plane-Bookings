class Api::UsersController < ApplicationController
    skip_before_action :authorize, only: [:create, :index]
    def create
        user = User.create!(user_params)
        # user.carts.create!(new_cart_hash)
        session[:user_id] = user.id
        render json: user, status: :created
    end
    # def index
    #     users = User.all
    #     render json: users 
    # end
    def show
        render json: @user
    end

    private
    def user_params
        params.permit(:username, :password, :password_confirmation, :name)
    end
    def new_cart_hash
        {status: "open", price_total: "0.00"}
    end
    
end
