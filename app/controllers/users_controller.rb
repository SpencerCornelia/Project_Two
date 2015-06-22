class UsersController < ApplicationController

	def index
		@user = current_user
	end

	def new
		@user = User.new
		render :show
	end

	def create
		user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number)
		@user = User.create(user_params)
		if @user.save
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			@errors = @user.errors.messages
		end	
	end

	def show
		@room = Room.new
		@user = User.find(params[:id])
		current_user
		render :show
	end

end
