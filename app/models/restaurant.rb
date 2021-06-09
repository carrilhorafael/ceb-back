class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :address

  validates :name, :cnpj, :open_at, :close_at, presence: true
end
