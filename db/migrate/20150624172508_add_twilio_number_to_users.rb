class AddTwilioNumberToUsers < ActiveRecord::Migration
 def change
 	add_column :users, :twilio_number, :string
 end
end
