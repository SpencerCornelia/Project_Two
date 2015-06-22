module RoomsHelper

	def set_room
	  @room = Room.find(params[:id])
	end

	def room_num
		params[:id]
	end

	def room_owner
		@owner = User.find(Room.find_by(id: params[:id]).user_id)
	end

end
