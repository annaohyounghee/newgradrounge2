class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
    	t.integer :user
      	t.integer :reachout

      	t.timestamps
    end
  end
end
