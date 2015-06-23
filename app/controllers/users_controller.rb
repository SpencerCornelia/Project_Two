class UsersController < ApplicationController

	before_action :logged_in?, only: [:edit, :destroy]
	before_action :set_user, only: [:index, :update, :destroy]

	def index
		@user = current_user
	end

	def new
		@user = User.new
		render :show
	end

	def create
		@user = User.create(user_params)
		if @user.save
			login(@user)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to root_path
			flash[:notice] = @user.errors.full_messages.to_sentence
		end	
	end

	def show
		@room = Room.new
		@user = User.find(params[:id])
		current_user
		render :show
	end

	def edit
	  @user = User.find(params[:id])
	  unless current_user == @user
	    redirect_to user_path(@user)
	  end
	end

	def update
	  @user.assign_attributes(user_params)
	  if @user.save
	    redirect_to "/users/#{@user.id}"
	  else
	    flash[:notice] = "Email already in use"
	    redirect_to edit_user_path
	  end
	end

	def destroy
	  @user.destroy()
	  logout
	  redirect_to root_path
	end

	private 

	def user_params
		user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number)
	end

	def set_user
	  @user = current_user
	end




end
