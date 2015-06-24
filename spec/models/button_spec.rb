require 'rails_helper'

RSpec.describe Button, type: :model do
  it "should validate presence of condition name" do
  	b = Button.new({condition: nil,
  						votes: 10,
  						room_id: 1})

  	expect(b.save).to eq(false)
  end

  it "should validate presence of condition length" do
  	b = Button.new({condition: "",
  						votes: 10,
  						room_id: 1})

  	expect(b.save).to eq(false)
  end

  it "should validate presence of votes" do
  	b = Button.new({condition: "break",
  						votes: nil,
  						room_id: 1})

  	expect(b.save).to eq(false)
  end

  it "should validate presence of room id" do
  	b = Button.new({condition: "break",
  						votes: 10,
  						room_id: nil})

  	expect(b.save).to eq(false)
  end
end
