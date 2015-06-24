class ButtonsController < ApplicationController

	def index
		@buttons = Button.all
		render :index
	end

	def new
		@button = Button.new
		render :new
	end

	def create
		@button = Button.new(button_params)
		respond_to do |format|
		  if @button.save
		    # format.html { redirect_to "/rooms/#{Room.find(@button.room_id).random_url}", success: 'Button was successfully created.' }
		    format.json { render json: @button, status: 200 }
		  else
		    # format.html { render :new }
		    format.json { render json: @button.errors, status: :unprocessable_entity }
		  end
		end
	end


	private 

	def button_params
	  params.require(:button).permit(:condition, :votes, :room_id)
	end


end
