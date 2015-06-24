class WelcomeController < ApplicationController

	before_action :current_user

	def index
		@user = User.new
	end

	def about
		render :about
	end

	def contact
		render :contact
	end

end
