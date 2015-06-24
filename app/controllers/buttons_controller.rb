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
		    redirect_to "/rooms/#{Room.find(@button.room_id).random_url}"
		  else
		    redirect_to "/rooms/#{Room.find(@button.room_id).random_url}"
		    flash[:notice] = @button.errors.full_messages.to_sentence
		  end
	end

	def destroy
		button_num
		@button.destroy()
		redirect_to :back
	end

	private 

	def button_params
	  params.require(:button).permit(:condition, :votes, :room_id)
	end


end