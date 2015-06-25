class AddColortoButtons < ActiveRecord::Migration
  def change
  	add_column :buttons, :color, :string
  end
end
