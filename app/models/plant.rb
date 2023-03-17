class Plant < ApplicationRecord
	validates :name, :species, presence: true
end
