class RoomsController < ApplicationController
	
	before_action :current_user

	before_action :current_user

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
		generate_unique_url
		respond_to do |format|
		  if @room.save
		    format.html { redirect_to "/rooms/#{@room.random_url}", success: 'Room was successfully created.' }
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
		@room = room.find(params[:id])
	end

	def update
	end

	def destroy
		room_num
		@room.destroy()
		redirect_to "/users/#{current_user.id}"
	end

	private

	def room_params
	  params.require(:room).permit(:name, :user_id)
	end

end
