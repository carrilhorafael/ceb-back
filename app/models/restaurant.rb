class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :address

  validates :name, :cnpj, :open_at, :close_at, :workdays, presence: true
  validates :open_at, :close_at, format: {with: /\b\d{2}\:\d{2}\z/}
end
