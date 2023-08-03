class Plant < ApplicationRecord
	has_many :waterings

	validates :name, :species, presence: true
end
