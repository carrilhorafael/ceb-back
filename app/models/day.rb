class Day < ApplicationRecord

    has_many :work_days
    has_many :restaurants, through: :work_days

end
