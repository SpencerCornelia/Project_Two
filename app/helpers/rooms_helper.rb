module RoomsHelper

	def set_room
	  @room = Room.find(params[:id])
	end

end
