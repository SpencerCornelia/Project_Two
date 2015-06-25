class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		# signin
		user_params = params.require(:user).permit(:email, :password)
		@user = User.confirm(user_params)
		if @user 
			login(@user)
			redirect_to "/users/#{@user.id}"
		else 
			redirect_to root_path
			flash[:notice] = "Could not match email and password"
		end
    end

    def destroy
    	logout
    	set_cache_buster
    	redirect_to root_path
    end
end
