class UsersController < ApplicationController

	def index
		@user = current_user
		render :index
	end

	def new
		@user = User.new
		render :new
	end

	def create
		user_params = params.require(:user).permit(:name, :email, :password_digest, :phone_number)
		@user = User.create(user_params)
		login(@user)
		redirect_to "/users/#{@user.id}"
	end

	def show
		@room = Room.new
		@user = User.find(params[:id])
		current_user
		render :show
	end

end
