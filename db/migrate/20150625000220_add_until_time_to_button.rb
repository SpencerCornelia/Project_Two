class AddUntilTimeToButton < ActiveRecord::Migration
   def change
  	add_column :buttons, :until_limit, :integer
  end
end
