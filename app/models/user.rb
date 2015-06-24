class User < ActiveRecord::Base

	has_secure_password
	
	has_many :rooms

	validates :email, uniqueness: true, confirmation: true
	validates :password, length: { minimum: 7}
	validates :phone_number, uniqueness: true, confirmation: true
	validates :twilio_number, uniqueness: true, confirmation: true

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end

end
