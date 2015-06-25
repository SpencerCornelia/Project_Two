class Button < ActiveRecord::Base

	belongs_to :room

	validates :condition, presence: true, :length => { :minimum => 1, :maximum => 50}
	validates :votes, presence: true
	validates :room_id, presence: true
	validates :time_limit, presence: true
	

end
