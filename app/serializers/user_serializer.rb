class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :cpf, :has_validated, :role, :times_logged, :last_login, :address_text

  def address_text
    self.object.address.street + ", " + self.object.address.number + ", " + self.object.address.city + ", " + self.object.address.state  
  end

  
end
