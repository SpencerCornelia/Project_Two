class User < ActiveRecord::Base

	has_secure_password
	
	has_many :rooms

	validates :email, uniqueness: true, presence: true
	validates :password, length: { minimum: 7}, confirmation: true
	validates :password_confirmation, length: {minimum: 7}, presence: true
	validates :phone_number, uniqueness: true, presence: true

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end

end
