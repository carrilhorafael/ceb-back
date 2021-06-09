class WorkDay < ApplicationRecord
  belongs_to :restaurant
  belongs_to :day

  validate :uniqueness_relationship

  def uniqueness_relationship
    WorkDay.find_by(restaurant_id: restaurant.id, day_id: day.id)
  end
end
