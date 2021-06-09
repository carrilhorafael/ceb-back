class ApplicationController < ActionController::API
    # rescue_from CanCan::AccessDenied do |exception|
    #     render json: {error: "Permissão negada"}, status: 403
    # end    
    def current_user
        User.find(decoded[0]["user_id"]) unless decoded.nil?
    end
    def decoded
        JsonWebToken.decode(auth_token) unless auth_token.nil?
    end
    def auth_token
        token = request.headers["Authorization"]
        token.split(" ").last if token.present?
    end
end
