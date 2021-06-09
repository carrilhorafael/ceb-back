class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :cnpj, :working_at, :address_text
  has_one :owner, class_name: "User"

  def address_text
    self.object.address.street + ", " + self.object.address.number + ", " + self.object.address.city + ", " + self.object.address.state  
  end
  def working_at
    "Aberto de " << self.object.open_at << " à " << self.object.close_at << " nos dias: " << self.object.workdays
  end

end
