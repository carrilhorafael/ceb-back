class AuthController < ApplicationController
    def login
        
    end
    def sign_up
        # @address = Address.new(address_params)
        # if @address.save
        # @user = User.new(user_params.merge(address_id: @address.id))
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 201
        else
            render json: @user.errors, status: 422
        end
        # end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :cpf)
        end
        def address_params
            params.require(:address).permit(:street, :number, :city, :state)
        end
end
