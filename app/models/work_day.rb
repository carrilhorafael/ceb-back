class WorkDay < ApplicationRecord
  belongs_to :restaurant
  belongs_to :day
end
