class Button < ActiveRecord::Base

	belongs_to :room

	validates :condition, presence: true, :length => { :minimum => 1, :maximum => 40}
	validates :votes, presence: true
	validates :room_id, presence: true
	

end
