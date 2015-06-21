class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.string :condition
      t.integer :votes

      t.timestamps null: false
    end
  end
end
