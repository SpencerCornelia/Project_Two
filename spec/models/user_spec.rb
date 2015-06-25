require 'rails_helper'

RSpec.describe User, type: :model do
	it "should validate presence of email" do
		u = User.new({name: "Bob",
						 email: nil, 
						 password: "blahblah",
						 password_confirmation: "blahblah", 
						 phone_number: "5107822467"})
		expect(u.save).to eq(false) 
	end  

	it "should validate uniqueness of email" do
		u = User.new({name: "Bob",
						 email: "bob@bob.com", 
						 password: "blahblah",
						 password_confirmation: "blahblah", 
						 phone_number: "5107822467"}).save
		t = User.new({name: "Bob",
						 email: "bob@bob.com", 
						 password: "blahblah",
						 password_confirmation: "blahblah", 
						 phone_number: "5107822468"})
		expect(t.save).to eq(false) 
	end 

	it "should validate presence of password" do
		u = User.new({name: "Bob",
						 email: "bob@boblover.com", 
						 password: "",
						 password_confirmation: "blahblah", 
						 phone_number: "5107822467"})
		expect(u.save).to eq(false)
	end

	it "should expect password length to be > 7" do
		u = User.new({name: "Bob",
						 email: "bob@boblover.com", 
						 password: "blah",
						 password_confirmation: "blah", 
						 phone_number: "5107822467"})
		expect(u.save).to eq(false)
	end

	it "should validate presence of password confirmation" do
		u = User.new({name: "Bob",
						 email: "bob@boblover.com", 
						 password: "blahblah",
						 password_confirmation: nil, 
						 phone_number: "5107822467"})
		expect(u.save).to eq(false)
	end

	it "should expect password to match with password confirm" do
		u = User.new({name: "Bob",
						 email: "bob@boblover.com", 
						 password: "blahblah",
						 password_confirmation: "blahbla", 
						 phone_number: "5107822467"})
		expect(u.save).to eq(false)	
	end

	it "should validate presence of phone number" do
		u = User.new({name: "Bob",
						 email: "bob@boblover.com", 
						 password: "blahblah",
						 password_confirmation: "blahblah", 
						 phone_number: nil})
		expect(u.save).to eq(false)
	end

	it "should validate uniqueness of phone number" do
		u = User.new({name: "Bob",
						 email: "bob@bob.com", 
						 password: "blahblah",
						 password_confirmation: "blahblah", 
						 phone_number: "5107822467"}).save
		t = User.new({name: "Bob",
						 email: "bob@bob.com", 
						 password: "blahblah",
						 password_confirmation: "blahblah", 
						 phone_number: "5107822467"})
		expect(t.save).to eq(false) 

end

