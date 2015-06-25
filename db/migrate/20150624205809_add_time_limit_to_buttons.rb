class AddTimeLimitToButtons < ActiveRecord::Migration
  def change
  	add_column :buttons, :time_limit, :integer
  end
end
