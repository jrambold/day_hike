class Trip < ApplicationRecord
    has_many :trip_trails
    has_many :trails, through: :trip_trails

    def total_distance
      trails.sum(:length)
    end

    def average_distance
      trails.average(:length)
    end

    def longest
      trails.maximum(:length)
    end
    
    def shortest
      trails.minimum(:length)
    end
end
