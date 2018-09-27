class Payment < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	belongs_to :reservation
end
