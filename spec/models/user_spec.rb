require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "is invalid without an email" do
  expect(User.new(email: nil)).to have(1).errors_on(:email)


	end

end



