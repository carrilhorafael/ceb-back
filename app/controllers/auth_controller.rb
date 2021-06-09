class AuthController < ApplicationController
    def login
        @user = User.find_by(email: params[:user][:credential])
        @user = User.find_by!(cpf: params[:user][:credential]) if @user.nil?
        if @user&.authenticate(params[:user][:password])
            token = JsonWebToken.encode({user_id: @user.id})
            render json: {token: token, user: @user}
        else
            render json: {error: "Não foi possível fazer o login"}, status: 401
        end
    end
    def sign_up
        @address = Address.new(address_params)
        if @address.save
            if user_params[:role] != 1 && user_params[:role] != 2
                @user = User.new(user_params.merge(address_id: @address.id))
                if @user.save
                    render json: @user, status: 201
                else
                    render json: @user.errors, status: 422
                end
            else
                render json: {error: "Você não pode criar um usuário dessa role"}, status: 403
            end
        end
    end
    def forgot
        @user = User.find_by(email: params[:credential])
        @user = User.find_by(cpf: params[:credential]) if @user.nil?
        if @user&.send_confirmation_token("forgot")
            render json: {status: "ok"}
        else
            render json: {error: "Não foi possível localizar esse usuário, tente fazer cadastro"}, status: 422
        end
    end
    def reset
        if params[:validation_token].present?
            @user = User.find_by(validation_token: params[:validation_token])
            if @user&.update(password: params[:password], password_confirmation: params[:password_confirmation])
                render json: @user
            else
                render json: @user.errors, status: 422
            end
        else
            render json: {errors: "Operação inválida"}, status: 422 
        end
    end
    def confirm
        if params[:validation_token].present?
            @user = User.find_by(validation_token: params[:validation_token])
            if @user&.confirm_user
                render json: {status: "ok"}
            else
                render json: {error: "Não foi possivel confirmar o usuário, o token já expirou"}, status: 422
            end
        else
            render json: {error: "Operação invalida"}, status: 400
        end
    end
    def resend_confirmation
        @user = User.find_by(email: params[:credential])
        @user = User.find_by(cpf: params[:credential]) if @user.nil?
        if @user&.send_confirmation_token("resend")
            render json: {status: "ok"}
        else
            render json: {error: "Não foi possivel localizar o usuário"}, status: 422
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :cpf, :role)
        end
        def address_params
            params.require(:address).permit(:street, :number, :city, :state)
        end
end
