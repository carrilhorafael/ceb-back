class User < ApplicationRecord
    has_secure_password

    validates :name, :email, :password_confirmation, :cpf, :phone, presence: true
    validates :email, format: {with: /\b[A-Z0-9._%a-z\-]+@+[a-z]+.[a-z]{2,4}\z/, message: "Utilize o seu email da UFF. Exemplo: meuemail@id.uff.br"}
    validates :cpf, format: {with: /\b\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "Utilize um cpf valido. Exemplo: 000.000.000-00"}
    validates :phone, format: {with: /(\(?\d{2}\)?\s)?(\d{4,5}\-\d{4})/, message: "Utilize um telefone valido. Exemplo: (21) 90000-0000"}
    belongs_to :address

end
