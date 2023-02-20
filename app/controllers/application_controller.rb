class ApplicationController < ActionController::API
  include ActionController::Cookies

    rescue_from ActiveRecord::RecordInvalid, with: :rescue_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    before_action :authorize
    private
    def rescue_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
    def rescue_not_found
        render json: {error: "Entry Not Found"}, status: :not_found
    end
    def authorize 
        @user = User.find_by(id: session[:user_id])
        return render json: {errors: ["Unauthorized Access"]}, status: :unauthorized unless @user
    end

end
        # demo testing eager loading with .includes
        # @user = User.includes(:products, carts:{cart_items: [:product]}).find_by(id: session[:user_id])