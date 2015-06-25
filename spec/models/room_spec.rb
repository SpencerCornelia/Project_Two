require 'rails_helper'

RSpec.describe Room, type: :model do
  it "should validate presence of room name" do
 	r = Room.new({name: nil,
 					user_id: 1,
 					random_url: "fb2a491442e9e5191e20"})
 	expect(r.save).to eq(false) 
  end

  it "should validate presence of room user_id" do
 	r = Room.new({name: "Blah",
 					user_id: nil,
 					random_url: "fb2a491442e9e5191e20"})
 	expect(r.save).to eq(false) 
  end

end
