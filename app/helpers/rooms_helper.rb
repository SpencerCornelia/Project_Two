module RoomsHelper
	require "securerandom"

	def set_room
	  @room = Room.find_by_random_url(params[:random_url])
	end

	def room_num
		params[:id]
	end

	def room_owner
		@owner = User.find(Room.find_by(id: params[:id]).user_id)
	end

	def generate_unique_url
		@room.random_url = SecureRandom.hex(10)
	end	

end
