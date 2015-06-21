class RoomsController < ApplicationController

	def index
		@rooms = Room.all
		render :index
	end

	def new
		@room = Room.new
		render :new
	end

	def create
		@room = current_user.rooms.create(room_params)
		respond_to do |format|
		  if @room.save
		    format.html { redirect_to @room, notice: 'Room was successfully created.' }
		    format.json { render :show, status: :created, name: @room }
		  else
		    format.html { render :new }
		    format.json { render json: @room.errors, status: :unprocessable_entity }
		  end
		end
	end

	def show
		set_room
		@button = Button.new
		render :show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def set_room
	  @room = Room.find(params[:id])
	end


end
