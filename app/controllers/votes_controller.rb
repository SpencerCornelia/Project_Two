class VotesController < ApplicationController

	require 'twilio-ruby'

	def create
		account_sid = ENV['TW_SID']
		auth_token = ENV['AUTH']
		button_id = params[:button_id]
		button = Button.find(button_id)
		room = Room.find(button.room_id)
		owner = User.find(room.user_id)

		session[:button] = session[:button] || []

		unless button.votes <= 0 or session[:button].include?(button.id)
			session[:button] << button.id
			# || session[:has_voted]
			session[:has_voted] = true
			button.votes -= 1
			button.save
			render json: button
		else
			render json: {status: "ERROR"}
		end
		
		if (button.votes == 0)
			@client = Twilio::REST::Client.new(account_sid, auth_token)
			@client.messages.create({:from => "15102300334",
			                                :to => owner.phone_number,
			                                :body => "The #{button.condition} condition has been met"})
		end
	end
end
