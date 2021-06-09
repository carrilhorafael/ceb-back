class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :cnpj, :open_at, :close_at, :address_text
  has_one :owner, class_name: "User"

  def address_text
    self.object.address.street + ", " + self.object.address.number + ", " + self.object.address.city + ", " + self.object.address.state  
  end

end
