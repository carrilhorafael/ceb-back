class Deliverman < ApplicationRecord
    belongs_to :user

    validates :cnh, :vehicle, presence: true
end
