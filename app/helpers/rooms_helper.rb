module RoomsHelper

	def set_room
	  @room = Room.find(params[:id])
	end

	def room_owner
		@owner = User.find(@room.user_id)
	end


end
