class AddIdToRooms < ActiveRecord::Migration
  def change
  	change_table :rooms do |r|
  		r.string :random_url
  	end
  end
end
