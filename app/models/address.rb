class Address < ApplicationRecord

    validates :street, :number, :city, :state, presence: true
    validates :number, numericality: {only_integer: true}
    has_one :user
    has_one :restaurant


end
