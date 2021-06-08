class AuthController < ApplicationController
    def login
        @user = User.find_by(email: params[:user][:credential])
        @user = User.find_by(cpf: params[:user][:credential]) if @user.nil?
        if @user&.authenticate(params[:user][:password])
            token = JsonWebToken.encode({user_id: @user.id})
            render json: {token: token}
        else
            render json: {error: "Não foi possível fazer o login"}, status: 401
        end
    end
    def sign_up
        @address = Address.new(address_params)
        if @address.save
            @user = User.new(user_params.merge(address_id: @address.id))
            if @user.save
                render json: @user, status: 201
                UserMailer.with(user: @user).confirm.deliver_now
            else
                render json: @user.errors, status: 422
            end
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :cpf)
        end
        def address_params
            params.require(:address).permit(:street, :number, :city, :state)
        end
end
