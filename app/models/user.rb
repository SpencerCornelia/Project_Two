class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates_confirmation_of :email
	validates :password_digest, presence: true

	def self.confirm(params)
		user = User.find_by({email: params[:email]})
		user.try(:authenticate, params[:password])
	end
end
