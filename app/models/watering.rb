class Watering < ApplicationRecord
	belongs_to :plant

	validates :timestamp, :quantity, :method, presence: true
	validates :method, inclusion: %w(over_the_soil bottom)
end
