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
		# @user = User.find(params[:id])
		@room = Room.new(room_params)
		respond_to do |format|
		  if @room.save
		    format.html { redirect_to @room, success: 'Room was successfully created.' }
		    format.json { render :show, status: :created, name: @room }
		  else
		    format.html { render :new }
		    format.json { render json: @room.errors, status: :unprocessable_entity }
		  end
		end
	end

	def show
		set_room
		# room_owner
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

	def room_params
	  params.require(:room).permit(:name, :user_id)
	end






end
