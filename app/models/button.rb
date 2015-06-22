class Button < ActiveRecord::Base

	belongs_to :room

	validates :condition, presence: true
	validates :votes, presence: true
	validates :room_id, presence: true
	

end
