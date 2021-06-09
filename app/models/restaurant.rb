class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :address
  has_many :work_days
  has_many :days, through: :work_days

  validates :name, :cnpj, :open_at, :close_at, presence: true
end
