class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :open_at, :close_at
  has_one :owner
end
