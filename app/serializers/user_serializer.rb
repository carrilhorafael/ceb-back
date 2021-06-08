class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password_digest, :email, :phone, :cpf, :address_text

  def address_text
    self.object.address.street + ", " + self.object.address.number + ", " + self.object.address.city + ", " + self.object.address.state  
  end
end
