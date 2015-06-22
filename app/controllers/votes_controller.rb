class VotesController < ApplicationController

	require 'twilio-ruby'

	def create
		button_id = params[:button_id]
		button = Button.find(button_id)
		room = Room.find(button.room_id)
		owner = User.find(room.user_id)
		unless button.votes <= 0 
		#|| session[:has_voted]
			session[:has_voted] = true
			button.votes -= 1
			button.save
			render json: button
		else
			render json: {status: "ERROR"}
		end
		if (button.votes == 0)
			account_sid = "ACd6c48d0044eed766b26814ec2b0d47e6"
			auth_token = "b7168586375b75187ea8e204365733b1"

			@client = Twilio::REST::Client.new(account_sid, auth_token)
			@client.messages.create({:from => "15102300334",
			                                :to => owner.phone_number,
			                                :body => "The #{button.condition} condition has been met"})
		end
	end
end
