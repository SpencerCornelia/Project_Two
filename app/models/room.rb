class Room < ActiveRecord::Base

	belongs_to :user
	has_many :buttons

	validates :name,
						:presence => true,
						:length => { :minimum => 1, :maximum => 50}

	validates :user_id, presence: true

end
