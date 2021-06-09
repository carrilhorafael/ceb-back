class User < ApplicationRecord
    has_secure_password

    validates :name, :email, :password_confirmation, :cpf, :phone, presence: true
    validates :password, :password_confirmation, length: {minimum: 8}, if: :password
    # validates :email, format: {with: /\b[A-Z0-9._%a-z\-]+@+[a-z]+.[a-z]{2,4}\z/, message: "Utilize o seu email da UFF. Exemplo: meuemail@id.uff.br"}
    validates :cpf, format: {with: /\b\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "Utilize um cpf valido. Exemplo: 000.000.000-00"}
    validates :phone, format: {with: /(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})/, message: "Utilize um telefone valido. Exemplo: (21) 90000-0000"}
    belongs_to :address

    enum role: {
        "Cliente":1,
        "Entregador":2,
        "Dono de restaurante":3,
        "Administrador":4
    }

    after_create :send_confirmation_token

    def send_confirmation_token
        self.validation_token = generate_token
        self.validation_token_expiry_at = Time.now.utc + 2.hours
        if self.save
            UserMailer.with(user: self).confirm.deliver_now            
        end
    end


    private
        def generate_token
            SecureRandom.alphanumeric(10)
        end

end
