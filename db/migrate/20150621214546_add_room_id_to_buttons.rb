class AddRoomIdToButtons < ActiveRecord::Migration
  def change
  	add_column :buttons, :room_id, :integer
  end
end
