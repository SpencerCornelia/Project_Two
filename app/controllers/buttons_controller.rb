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
		@button = current_user.rooms.buttons.create(button_params)
		respond_to do |format|
		  if @button.save
		    format.html { redirect_to @button, notice: 'Button was successfully created.' }
		    format.json { render :show, status: :created, condition: @button }
		  else
		    format.html { render :new }
		    format.json { render json: @button.errors, status: :unprocessable_entity }
		  end
		end
	end

	private 

	def button_params
	  params.require(:button).permit(:condition, :votes)
	end



end
