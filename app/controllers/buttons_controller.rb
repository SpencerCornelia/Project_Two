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
		  if @button.save
		  	#may need to do this with ajax later
		    redirect_to "/rooms/#{@button.room_id}"
		  else
		    flash[:notice] = "Invalid Input"
		    redirect_to "/rooms/#{@button.room_id}"
		  end
	end

	private 

	def button_params
	  params.require(:button).permit(:condition, :votes, :room_id)
	end


end
